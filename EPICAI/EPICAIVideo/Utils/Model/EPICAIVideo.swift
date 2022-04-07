//
//  EPICAIVideo.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import CoreData
import CoreLocation

/// Application define Model, Responsible to localize video response
/// Transformation form from various API's like ListVideoShareWithLikeQuery, ListShareableVideoQuery, ListShareableVideobyUserQuery, ListVideobyUserQuery, ListVideosQuery
struct  EPICAIVideo {
    
    var videoUUID:String = defaultText
    var userUUID:String = defaultText
    var dataTime:String = defaultText
    var videoName:String = defaultText
    var videoSize:String = defaultText
    var videoInfo:String = defaultText
    var videoPath:String = defaultText
    var share:Int = defaultInt
    var videoShare:Int = defaultInt
    var videoDuration:Double = defaultDouble
    var videoStatus:Int = defaultInt
    var videoUploadStatus:String = defaultText
    var analyseStatus:String = defaultText
    var likeCount:Int = defaultInt
    var commentsCount:Int = defaultInt
    var title:String = defaultText
    var latitude:String = defaultText
    var longitude:String = defaultText
    var likeStatus:Int = defaultInt
    var active:Int = defaultInt
    var status:String = defaultText
    var score:Int = defaultInt
    
    init(){ }
    
    init(awsListVideo:ListVideoShareWithLikeQuery.Data.ListVideoShareWithLike) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime ?? ""
        self.videoName = awsListVideo.videoName ?? ""
        self.videoSize = awsListVideo.videoSize ?? ""
        self.videoInfo = awsListVideo.videoInfo ?? ""
        self.videoPath = awsListVideo.path ?? ""
        self.share = awsListVideo.share ?? 0
        self.videoShare = awsListVideo.shareVideo ?? 0
        self.videoDuration = awsListVideo.videoDuration ?? 0.0
        self.videoStatus = awsListVideo.active ?? 0
        self.videoUploadStatus = awsListVideo.uploadStatus ?? ""
        self.analyseStatus = awsListVideo.analyseStatus ?? ""
        self.likeCount = awsListVideo.likesCount ?? 0
        self.commentsCount = awsListVideo.commentsCount ?? 0
        self.title = awsListVideo.title ?? ""
        self.latitude = awsListVideo.latitude ?? ""
        self.longitude = awsListVideo.longitude ?? ""
        self.likeStatus = awsListVideo.likeStatus ?? 0
        self.score = awsListVideo.score ?? 0
    }
    
    init(awsListVideo:ListShareableVideoQuery.Data.ListShareableVideo) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime ?? ""
        self.videoName = awsListVideo.videoName ?? ""
        self.videoSize = awsListVideo.videoSize ?? ""
        self.videoInfo = awsListVideo.videoInfo ?? ""
        self.videoPath = awsListVideo.path ?? ""
        self.videoShare = awsListVideo.share ?? 0
        self.videoDuration = awsListVideo.videoDuration ?? 0.0
        self.videoStatus = awsListVideo.active ?? 0
        self.videoUploadStatus = awsListVideo.uploadStatus ?? ""
        self.analyseStatus = awsListVideo.analyseStatus ?? ""
        self.likeCount = awsListVideo.likesCount ?? 0
        self.commentsCount = awsListVideo.commentsCount ?? 0
        self.title = awsListVideo.title ?? ""
        self.latitude = awsListVideo.latitude ?? ""
        self.longitude = awsListVideo.longitude ?? ""
    }
    
    init(awsListVideo:ListShareableVideobyUserQuery.Data.ListShareableVideobyUser) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime ?? ""
        self.videoName = awsListVideo.videoName ?? ""
        self.videoSize = awsListVideo.videoSize ?? ""
        self.videoInfo = awsListVideo.videoInfo ?? ""
        self.videoPath = awsListVideo.path ?? ""
        self.videoShare = awsListVideo.share ?? 0
        self.videoDuration = awsListVideo.videoDuration ?? 0.0
        self.videoStatus = awsListVideo.active ?? 0
        self.videoUploadStatus = awsListVideo.uploadStatus ?? ""
        self.analyseStatus = awsListVideo.analyseStatus ?? ""
        self.likeCount = awsListVideo.likesCount ?? 0
        self.commentsCount = awsListVideo.commentsCount ?? 0
        self.title = awsListVideo.title ?? ""
        self.latitude = awsListVideo.latitude ?? ""
        self.longitude = awsListVideo.longitude ?? ""
    }
    
    init(awsListVideo:ListVideobyUserQuery.Data.ListVideobyUser) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime ?? ""
        self.videoName = awsListVideo.videoName ?? ""
        self.videoSize = awsListVideo.videoSize ?? ""
        self.videoInfo = awsListVideo.videoInfo ?? ""
        self.videoPath = awsListVideo.path ?? ""
        self.share = awsListVideo.share ?? 0
        self.videoShare = awsListVideo.shareVideo ?? 0
        self.videoDuration = awsListVideo.videoDuration ?? 0.0
        self.videoStatus = awsListVideo.active ?? 0
        self.videoUploadStatus = awsListVideo.uploadStatus ?? ""
        self.analyseStatus = awsListVideo.analyseStatus ?? ""
        self.likeCount = awsListVideo.likesCount ?? 0
        self.commentsCount = awsListVideo.commentsCount ?? 0
        self.title = awsListVideo.title ?? ""
        self.latitude = awsListVideo.latitude ?? ""
        self.longitude = awsListVideo.longitude ?? ""
        self.status = awsListVideo.status ?? ""
        self.score = awsListVideo.score ?? 0
    }
    
    init(awsListVideo:ListVideosQuery.Data.ListVideo) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime ?? ""
        self.videoName = awsListVideo.videoName ?? ""
        self.videoSize = awsListVideo.videoSize ?? ""
        self.videoInfo = awsListVideo.videoInfo ?? ""
        self.videoPath = awsListVideo.path ?? ""
        self.share = awsListVideo.share ?? 0
        self.videoShare = awsListVideo.shareVideo ?? 0
        self.videoDuration = awsListVideo.videoDuration ?? 0.0
        self.videoStatus = awsListVideo.active ?? 0
        self.videoUploadStatus = awsListVideo.uploadStatus ?? ""
        self.analyseStatus = awsListVideo.analyseStatus ?? ""
        self.likeCount = awsListVideo.likesCount ?? 0
        self.commentsCount = awsListVideo.commentsCount ?? 0
        self.title = awsListVideo.title ?? ""
        self.latitude = awsListVideo.latitude ?? ""
        self.longitude = awsListVideo.longitude ?? ""
    }
    
    /// This function convert the response retrive from API name ListShareableVideoQuery
    /// Parameter take as aws array of [ListShareableVideoQuery.Data.ListShareableVideo?]
    /// Tranform result into array of [EPICAIVideo]
    static func feedItemsFromArray(awsItems:[ListShareableVideoQuery.Data.ListShareableVideo?]) -> [EPICAIVideo] {
        var items:[EPICAIVideo] = []
        for item in awsItems {
            if let awItems = item {
                items.append(EPICAIVideo(awsListVideo: awItems))
            }
        }
        return items
    }
    
    init(videoTitle:String, videoURL:URL, location:CLLocation?) {
        self.videoUUID = videoURL.lastPathComponent.replacingOccurrences(of: videoExtension, with: "")
        self.userUUID = EPICAISharedPreference.userSession?.uuid ?? ""
        self.dataTime = Date().getServerDate()
        self.videoName = videoURL.lastPathComponent
        self.videoSize = videoURL.getResourceSize() ?? "0"
        self.videoInfo = videoURL.pathExtension
        self.videoPath = videoURL.absoluteString
        self.share =  0
        self.videoShare = 0
        self.videoDuration = videoURL.getDuration()
        self.videoStatus = 1
        self.videoUploadStatus = ""
        self.analyseStatus = ""
        self.likeCount =  0
        self.commentsCount = 0
        self.title = videoTitle
        self.latitude = (location == nil) ? "" : String(location!.coordinate.latitude)
        self.longitude = (location == nil) ? "" : String(location!.coordinate.longitude)
        self.likeStatus = 0
    }
    
    func toManagedObject() -> EPICAIVideoTable {
        let manageObject = EPICAIVideoTable()
        manageObject.videoTitle = self.title
        manageObject.videoUUID = self.videoUUID
        manageObject.videoName = self.videoName
        manageObject.videoSize = self.videoSize
        manageObject.videoInfo = self.videoInfo
        manageObject.videoURL = self.videoPath
        manageObject.userUUID = self.userUUID
        manageObject.dateTime = self.dataTime
        manageObject.share = Int16(self.share)
        manageObject.videoDuration = self.videoDuration
        manageObject.active = Int16(Int(self.active))
        manageObject.uploadStatus = self.videoUploadStatus
        manageObject.commentCount = 0
        manageObject.likeCount = 0
        manageObject.longitude = self.longitude
        manageObject.latitude = self.latitude
        return manageObject
    }
    
    func toVideoItem(videoManagedObject:EPICAIVideoTable) -> EPICAIVideo {
        var videoItem = EPICAIVideo()
        videoItem.title = videoManagedObject.videoTitle ?? ""
        videoItem.videoUUID = videoManagedObject.videoUUID ?? ""
        videoItem.videoName = videoManagedObject.videoName ?? ""
        videoItem.videoSize = videoManagedObject.videoSize ?? ""
        videoItem.videoInfo = videoManagedObject.videoInfo ?? ""
        videoItem.videoPath = videoManagedObject.videoURL ?? ""
        videoItem.userUUID = videoManagedObject.userUUID ?? ""
        videoItem.dataTime = videoManagedObject.dateTime ?? ""
        videoItem.share = Int(videoManagedObject.share)
        videoItem.videoDuration = videoManagedObject.videoDuration
        videoItem.active = Int(videoManagedObject.active)
        videoItem.videoUploadStatus = videoManagedObject.uploadStatus ?? "0"
        videoItem.commentsCount = 0
        videoItem.likeCount = 0
        videoItem.longitude = videoManagedObject.longitude ?? ""
        videoItem.latitude = videoManagedObject.latitude ?? ""
        return videoItem
    }
}
