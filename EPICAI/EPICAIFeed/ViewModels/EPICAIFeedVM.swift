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
        if self.requestOnProgress { return }
        
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        self.requestOnProgress = true
        let checkUserLikeTable = ListVideoLikebyVideoAndUserQuery(user_uuid: userUUID, video_uuid: videoItem.video.videoUUID)
        
        appSyncClient?.fetch(query: checkUserLikeTable, cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let _ = error { }
            else if let _ = result?.errors { }
            else {
                if let result = result?.data?.listVideoLikebyVideoAndUser {
                    if result.count > 0 {
                        appSyncClient?.perform(mutation: DeleteVideoLikeMutation(video_like_uuid:  result[0]!.videoLikeUuid), resultHandler: { result, error in
                            if let _ = error { }
                            else if let _ = result?.errors { }
                            else {
                                completion(indexPath)
                            }
                        })
                    }
                    else {
                        let createVideoLike = CreateVideo_likeInput(videoLikeUuid: UUID().uuidString, userUuid: userUUID, videoUuid:videoItem.video.videoUUID, createdDatetime: Date().getServerDate())
                        appSyncClient?.perform(mutation: CreateVideoLikeMutation(createVideo_likeInput: createVideoLike), resultHandler: { result, error in
                            if let _ = error { }
                            else if let _ = result?.errors { }
                            else {
                                completion(indexPath)
                            }
                        })
                    }
                }
            }
            self.requestOnProgress = false
        })
    }
    
    func reportVideo(epicFeedItem:EPICAIFeedItem, comment:String ,  completion:@escaping (Bool) -> Void ) {
        
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        
        let createReportInput = CreateReportInput(reportUuid: UUID().uuidString,
                                                  byUser: userUUID,
                                                  datetime: Date().getServerDate(),
                                                  status: 1,
                                                  message: comment,
                                                  type: "video",
                                                  videoUuid: epicFeedItem.video.videoUUID)
        
        appSyncClient?.perform(mutation: CreateReportMutation(createReportInput: createReportInput), resultHandler: { result, error in
            if let _ = error { completion(false) }
            else if let _ = result?.errors?[0] { completion(false) }
            else  { completion(true) }
        })
    }
    
    func getVideosList(){
        var results = [EPICAIFeedItem]()
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
                                var feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                
                                // CREATED BY KANG YEE CHIA : 5th APRIL 2022
                                // Assign analyzed result to each object
                                // Speed of Speech
                                if let speedResult = uwvideo.speedResult, speedResult.count > 0 {
                                    feedItem.speedOfSpeech = SpeedOfSpeech.speedOfResult(awsResultArray: speedResult)
                                    //SpeedOfSpeech.speedOfResult(awsResultArray: speedResult)
                                    //print("[DEBUG] EPICAIFeedVM : \(speedResult)")
                                }
                                // Body Language
                                if let blResult = uwvideo.blResult, blResult.count > 0 {
                                    feedItem.bodyLaguageResult =  BodyLanguage.bodyLanguages(awsResultArray: blResult)
                                }
                                // Tonality
                                if let  tonalityResult = uwvideo.tonalityResult, tonalityResult.count > 0 {
                                    feedItem.tonalityResult = TonalityResult.tonalityResult(awsResultArray: tonalityResult)
                                    
                                    if let tonalityResultArray = uwvideo.tonalityResultDetail, tonalityResultArray.count > 0 {
                                        feedItem.tonalityResult?.results = TonalityResult.tonalityResultDetails(awsResultArray: tonalityResultArray)
                                    }
                                }
                                //filler words
                                if let  fwResult = uwvideo.fwResult , fwResult.count > 0 {
                                    feedItem.fillerWords = FillerWord.fillerWords(awsResultArray: fwResult)
                                }
                                
                                
                                
                                if let imageURLString = user.imageUrl {
                                    AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                                        if let imageURL = imageURL {
                                            do {
                                                let data = try Data(contentsOf: imageURL)
                                                //var feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                                feedItem.userImage = UIImage(data: data)
                                                results.append(feedItem)
                                                group.leave()
                                            } catch {
                                                //let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                                results.append(feedItem)
                                                group.leave()
                                            }
                                        } else {
                                            //let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                            results.append(feedItem)
                                            group.leave()
                                        }
                                    }
                                }
                                else {
                                    //let feedItem = EPICAIFeedItem(video: EPICAIVideo(awsListVideo: uwvideo), user: EPICAIUser(awsListUser: user))
                                    results.append(feedItem)
                                    group.leave()
                                }
                            }
                        }
                    }
                }
                group.notify(queue: .main) {
                    //print("[DEBUG] EPICAIFeedVM : \(results)")
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
