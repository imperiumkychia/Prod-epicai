//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import Amplify
import UIKit

class EPICAIProfileVM: NSObject {
    
    private var user:EPICAIUser?
    private var users = [EPICAIUser]()
    // User properties
    var onUserInfoChange: ((EPICAIUserAccountItem?) -> Void) = { _ in }
    private(set) var userItem: EPICAIUserAccountItem? {
        didSet {
            onUserInfoChange(userItem)
        }
    }
    
    var onReceiveVideos: (([EPICAIFeedItem]?) -> Void) = { _ in }
    private(set) var items: [EPICAIFeedItem]? {
        didSet {
            onReceiveVideos(items)
        }
    }
    
    var onReceiveVideosURLs: (([EPICAIFeedItem]?) -> Void) = { _ in }
    private(set) var itemsWithURL: [EPICAIFeedItem]? {
        didSet {
            onReceiveVideosURLs(itemsWithURL)
        }
    }
    
    init(user:EPICAIUser?) {
        self.user = user
    }
    
    override init() {
        super.init()
    }
    
    func getUserInfo() {
        if let user = self.user {
            self.fetchUserDetails(user: user)
        }
        else {
            AuthService.shared().getCurrentUserUUID { (uuid) in
                if let uuid = uuid {
                    self.fetchUserDetails(user: EPICAIUser(userUUID: uuid))
                }
            }
        }
    }
    
    func fetchUserDetails(user:EPICAIUser) {
        appSyncClient?.fetch(query: GetUserQuery(user_uuid: user.uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let user = result?.data?.getUser {
                if let imageURLString = user.imageUrl {
                    AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                        if let imageURL = imageURL {
                            do {
                                let data = try Data(contentsOf: imageURL)
                                self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: UIImage(data: data))
                            } catch {
                                self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                            }
                        } else {
                            self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                        }
                    }
                } else {
                    self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                }
            }
        })
    }
    
    func getVideosList(){
        if let user = self.user {
            self.fetchUserFeedItems(user: EPICAIUser(userUUID: user.uuid))
        }
        else {
            if let userUUID = EPICAISharedPreference.userSession?.uuid {
                self.fetchUserFeedItems(user: EPICAIUser(userUUID: userUUID))
            }
        }
    }
    
    func fetchUserFeedItems(user:EPICAIUser) {
        var results = [EPICAIFeedItem]()
        appSyncClient?.fetch(query: ListVideobyUserQuery(user_uuid: user.uuid),cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            guard let unWrappedVideosList = result?.data?.listVideobyUser else { self.items = nil ; return }
            let group = DispatchGroup()
            for video in unWrappedVideosList {
                if let uwvideo = video {
                    group.enter()
                    appSyncClient?.fetch(query: GetUserQuery(user_uuid:uwvideo.userUuid), cachePolicy: .fetchIgnoringCacheData) {
                        (result, error) in
                        if let user = result?.data?.getUser {
                            if let imageURLString = user.imageUrl {
                                AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                                    if let imageURL = imageURL {
                                        do {
                                            let data = try Data(contentsOf: imageURL)
                                            var feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                            feedItem.userImage = UIImage(data: data)
                                            results.append(feedItem)
                                            group.leave()
                                        } catch {
                                            let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                            results.append(feedItem)
                                            group.leave()
                                        }
                                    } else {
                                        let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                        results.append(feedItem)
                                        group.leave()
                                    }
                                }
                            }
                            else {
                                let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                results.append(feedItem)
                                group.leave()
                            }
                        }
                    }
                }
            }
            group.notify(queue: .main) {
                self.items = results
            }
        }
    }
    
    func getVideoLocalURLs(for items: [EPICAIFeedItem]) {
        var results = [EPICAIFeedItem]()
        let group = DispatchGroup()
        for item in items {
            group.enter()
            if !item.video.videoName.isEmpty {
                print("Profile Video name: \(item.video.videoName)")
                _ = Amplify.Storage.getURL(key: item.video.videoName, options: .none, resultListener: { result in
                    var dummyItem = item
                    switch result {
                    case .failure(let error):
                        print("Video URL Error \(error.localizedDescription)")
                        dummyItem.videoLocalURL = nil
                        results.append(dummyItem)
                        group.leave()
                    case .success(let url):
                        dummyItem.videoLocalURL = url
                        print("Video URL In Profile \(url)")
                        results.append(dummyItem)
                        group.leave()
                    }
                })
            }
        }
        group.notify(queue: .main) {
            self.itemsWithURL = results
        }
    }
}
