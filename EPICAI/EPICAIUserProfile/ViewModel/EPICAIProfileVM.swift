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
    
    override init() {
        super.init()
    }
    
    func getUserInfo() {
        AuthService.shared().getCurrentUserUUID { (uuid) in
            if let uuid = uuid {
                appSyncClient?.fetch(query: GetUserQuery(user_uuid: uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
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
        }
    }
    
    func getVideosList(){
        var results = [EPICAIFeedItem]()
        if let userUUID = EPICAISharedPreference.userSession?.uuid {
            appSyncClient?.fetch(query: ListVideobyUserQuery(user_uuid: userUUID),cachePolicy: .fetchIgnoringCacheData) {(result, error) in
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
    }
    
    func getVideoLocalURLs(for items: [EPICAIFeedItem]) {
        var results = [EPICAIFeedItem]()
        let group = DispatchGroup()
        for item in items {
            group.enter()
            if !item.video.videoName.isEmpty {
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
