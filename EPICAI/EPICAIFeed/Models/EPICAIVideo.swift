//
//  EPICAIVideo.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation

struct  EPICAIVideo{
    var videoUUID:String = defaultText
    var userUUID:String = defaultText
    var dataTime:String = defaultText
    var videoName:String = defaultText
    var videoSize:String = defaultText
    var videoInfo:String = defaultText
    var videoPath:String = defaultText
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
    
    init(awsListVideo:ListShareableVideoQuery.Data.ListShareableVideo) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime
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
        self.dataTime = awsListVideo.datetime
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
    
    init(awsListVideo:ListVideosQuery.Data.ListVideo) {
        self.videoUUID = awsListVideo.videoUuid
        self.userUUID = awsListVideo.userUuid
        self.dataTime = awsListVideo.datetime
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
    
    static func feedItemsFromArray(awsItems:[ListShareableVideoQuery.Data.ListShareableVideo?]) -> [EPICAIVideo] {
        var items:[EPICAIVideo] = []
        for item in awsItems {
            if let awItems = item {
                items.append(EPICAIVideo(awsListVideo: awItems))
            }
        }
        return items
    }
}
