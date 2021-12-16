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
    
    func updateLikeCount(videoItem:EPICAIFeedItem, indexPath:IndexPath, completion:@escaping (IndexPath?) -> Void ) {
        let videoMutaionInput = UpdateVideoInput(videoUuid: videoItem.video.videoUUID, likesCount: videoItem.video.likeCount+1)
        appSyncClient?.perform(mutation: UpdateVideoMutation(updateVideoInput: videoMutaionInput), resultHandler: { result, error in
            if error != nil{
                completion(nil)
                print(error ?? "Error Getting Lists")
            }
            if let resultError = result?.errors {
                completion(nil)
                print("Error saving the item on server: \(resultError)")
                return
            }
            else {
                completion(indexPath)
                print("Success updateLikeCount : \(String(describing: result))")
            }
        })
    }
    
    func getVideosList(){
        var results = [EPICAIFeedItem]()
        appSyncClient?.fetch(query: ListVideosQuery(),cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            guard let unWrappedVideosList = result?.data?.listVideos else { self.items = nil ; return }
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
