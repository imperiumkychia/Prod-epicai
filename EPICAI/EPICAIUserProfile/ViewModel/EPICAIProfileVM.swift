//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import Amplify
import UIKit

/// Application define View Model, Class name EPICAIProfileVM
/// Responsible to retrive data from API's, User Related
/// Convert data into application define model.
/// Respond to controller.
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
    
    /// Function responsible to assign user data
    /// Assign user values into property called, user
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
        if let selfUUID = EPICAISharedPreference.userSession?.uuid, selfUUID != user.uuid {
            appSyncClient?.fetch(query: GetOtherUserProfileQuery(user_uuid: user.uuid, current_user_uuid: selfUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
                if let user = result?.data?.getOtherUserProfile {
                    if let imageURLString = user.imageUrl {
                        AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                            if let imageURL = imageURL {
                                do {
                                    let data = try Data(contentsOf: imageURL)
                                    self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsOtherUserDetails: user), userImage: UIImage(data: data))
                                } catch {
                                    self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsOtherUserDetails: user), userImage: nil)
                                }
                            } else {
                                self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsOtherUserDetails: user), userImage: nil)
                            }
                        }
                    } else {
                        self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsOtherUserDetails: user), userImage: nil)
                    }
                }
            })
        }
        else {
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
        
    }
    
    /// Function responsible to assign user data
    /// Assign user values into property called, items
    /// Notify controller too.
    func getVideosList(){
        if let user = self.user {
            self.fectchOtherUsersProfileItem(user: user)
        }
        else {
            if let userUUID = EPICAISharedPreference.userSession?.uuid {
                self.fetchUserFeedItems(user: EPICAIUser(userUUID: userUUID))
            }
        }
    }
    
    /// Function responsible to fetch video list, using API ListShareableVideobyUserQuery
    /// Assign user values into property called, items
    /// Notify controller too.
    func fectchOtherUsersProfileItem(user:EPICAIUser) {
        if let userUUID = EPICAISharedPreference.userSession?.uuid {
            var results = [EPICAIFeedItem]()
            appSyncClient?.fetch(query: ListShareableVideobyUserQuery(user_uuid: user.uuid, current_user_uuid: userUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: {(result, error) in
                guard let unWrappedVideosList = result?.data?.listShareableVideobyUser else { self.items = nil ; return }
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
            })
        }
    }
    
    /// Function responsible to fetch feed video list, using API ListVideobyUserQuery
    /// Assign user values into property called, items
    /// Notify controller too.
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
    
    /// Function responsible to follow/Unfollow
    /// Notify controller too.
    func performFollow(state:Bool, selectedUser:EPICAIUser, completion:@escaping (Bool) -> Void) {
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        if (state) {
            let createFollowInput = CreateFollowInput(followUuid: UUID().uuidString, userUuid: userUUID, following: selectedUser.uuid)
            appSyncClient?.perform(mutation: CreateFollowMutation(createFollowInput: createFollowInput), resultHandler:  { result, error in
                if let _ = error {
                    completion(false)
                }
                else if let _ = result?.errors?[0] {
                    completion(false)
                }
                else {
                    completion(true)
                }
            })
        }
        else {
            let deleteFollowMutation = DeleteFollowMutation(user_uuid: userUUID, following: selectedUser.uuid)
            appSyncClient?.perform(mutation: deleteFollowMutation, resultHandler:  { result, error in
                if let _ = error {
                    completion(false)
                }
                else if let _ = result?.errors?[0] {
                    completion(false)
                }
                else {
                    completion(true)
                }
            })
        }
    }
    
    /// Extraction video's URL from [EPICAIFeedItem]
    /// AWS S3 URls
    /// Assign items to itemsWithURL
    /// Notify controller too.
    func getVideoLocalURLs(for items: [EPICAIFeedItem]) {
        var results = [EPICAIFeedItem]()
        let group = DispatchGroup()
        for item in items {
            group.enter()
            if !item.video.videoName.isEmpty {
                _ = Amplify.Storage.getURL(key: item.video.videoName, options: .none, resultListener: { result in
                    var dummyItem = item
                    switch result {
                    case .failure(_):
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
