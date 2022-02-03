//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit
import Amplify

class EPICAIFeedVM: NSObject {
    
    var requestOnProgress = false
    var onReceiveVideos: (([EPICAIFeedItem]?) -> Void) = { _ in }
    var onReceiveVideosURLs: (([EPICAIFeedItem]?) -> Void) = { _ in }
    
    private(set) var items: [EPICAIFeedItem]? {
        didSet {
            onReceiveVideos(items)
        }
    }
    
    private(set) var itemsWithURL: [EPICAIFeedItem]? {
        didSet {
            onReceiveVideosURLs(itemsWithURL)
        }
    }
    
    override init() {
        super.init()
    }
}

extension EPICAIFeedVM {
    
    func updateLikeCount(videoItem:EPICAIFeedItem, indexPath:IndexPath,likeState:Bool, completion:@escaping (IndexPath?) -> Void ) {
        
        print("Index path :\(indexPath)")
        if self.requestOnProgress { return }
        
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        self.requestOnProgress = true
        let checkUserLikeTable = ListVideoLikebyVideoAndUserQuery(user_uuid: userUUID, video_uuid: videoItem.video.videoUUID)
        
        appSyncClient?.fetch(query: checkUserLikeTable, cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let error = error {
                print("Error while fetching like details : \(error.localizedDescription)")
            }
            else if let errors = result?.errors {
                print("Error while fetching like details : \(errors[0].localizedDescription)")
            }
            else {
                if let result = result?.data?.listVideoLikebyVideoAndUser {
                    print("Result : \(result)")
                   
                    if result.count > 0 {
                        appSyncClient?.perform(mutation: DeleteVideoLikeMutation(video_like_uuid:  result[0]!.videoLikeUuid), resultHandler: { result, error in
                            if let error = error {
                                print("Error while deleting record :\(error)")
                            }
                            else if let errors = result?.errors {
                                print("Error while deleting record :\(errors[0])")
                            }
                            else {
                                completion(indexPath)
                                print("Record deleted successfully")
                            }
                        })
                    }
                    else {
                        let createVideoLike = CreateVideo_likeInput(videoLikeUuid: UUID().uuidString, userUuid: userUUID, videoUuid:videoItem.video.videoUUID, createdDatetime: Date().getServerDate())
                        appSyncClient?.perform(mutation: CreateVideoLikeMutation(createVideo_likeInput: createVideoLike), resultHandler: { result, error in
                            if let error = error {
                                print("Error while create video like record :\(error)")
                            }
                            else if let errors = result?.errors {
                                print("Error while create video like record :\(errors[0])")
                            }
                            else {
                                completion(indexPath)
                                print("Record created successfully")
                            }
                        })
                    }
                }
            }
            self.requestOnProgress = false
        })
    }
    
    func getVideosList(){
        var results = [EPICAIFeedItem]()
        print("User uuid :\(String(describing: EPICAISharedPreference.userSession?.uuid))")
        if let userUUID = EPICAISharedPreference.userSession?.uuid {
            appSyncClient?.fetch(query: ListVideoShareWithLikeQuery(user_uuid: userUUID),cachePolicy: .fetchIgnoringCacheData) {(result, error) in
                guard let unWrappedVideosList = result?.data?.listVideoShareWithLike else { self.items = nil ; return }
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
                print("Video name: \(item.video.videoName)")
                _ = Amplify.Storage.getURL(key: item.video.videoName, options: .none, resultListener: { result in
                    var dummyItem = item
                    switch result {
                    case .failure(let error):
                        print("Error \(error.localizedDescription)")
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
