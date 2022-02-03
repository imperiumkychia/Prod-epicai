//
//  EPICAICommentVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation
import UIKit

class EPICAICommentVM :NSObject {
    
    var onReciveComments:( ([EPICAICommentItem]?) -> Void) = { _ in }
    
    var onUpdateCommentsCount:( (IndexPath) -> Void) = { _ in }
    
    var items: [EPICAICommentItem]? {
        didSet {
            onReciveComments(items)
        }
    }

    override init() {
        super.init()
    }
    
    func updateFeedCommentCount(feedItem:EPICAIFeedItem, indexPath:IndexPath) {
        let videoMutaionInput = UpdateVideoInput(videoUuid: feedItem.video.videoUUID, commentsCount: feedItem.video.commentsCount+1)
        appSyncClient?.perform(mutation: UpdateVideoMutation(updateVideoInput: videoMutaionInput), resultHandler: { result, error in
            if error != nil{
                print(error ?? "Error Getting Lists")
            }
            if let resultError = result?.errors {
                print("Error saving the item on server: \(resultError)")
                return
            }
            else {
                self.onUpdateCommentsCount(indexPath)
                print("Success updateFeedCommentCount : \(String(describing: result))")
            }
        })
    }
    
    func addComment(feedItem:EPICAIFeedItem, text:String, indexPath:IndexPath, completion:@escaping (EPICAICommentItem?) -> Void) {
        
        let commentUuid = UUID().uuidString
        
        guard let userSession = EPICAISharedPreference.userSession else { return }
        
        let mutationInput = CreateCommentInput(commentUuid: commentUuid, videoUuid: feedItem.video.videoUUID, userUuid: userSession.uuid, comment: text, createdOn: Date().getServerDate() , repliedTo: "", modifiedOn: nil)
        
        appSyncClient?.perform(mutation: CreateCommentMutation(createCommentInput: mutationInput), resultHandler: {
            (result, error) in
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
                    let comment = EPICAIComment(uuid: commentUuid, videoUUID: feedItem.video.videoUUID, userUUID: userSession.uuid, comment: text, createdOn: Date().getServerDate(), repliedTo: "", modifiedOn: "")
                    var epicCommentItem = EPICAICommentItem(comment: comment, user: userSession)
                    epicCommentItem.userImage = EPICAIFileManager.shared().getEPICAIUserSessionImage()
                    completion(epicCommentItem)
                    self.updateFeedCommentCount(feedItem: feedItem, indexPath: indexPath)
                }
        })
    }
    
    func addReplyOnComment(item:EPICAIComment, feedItem:EPICAIFeedItem, text:String, completion:@escaping (EPICAICommentItem?) -> Void) {

        let commentUuid = UUID().uuidString
        
        guard let userSession = EPICAISharedPreference.userSession else { return }
        
        let mutationInput = CreateCommentInput(commentUuid: commentUuid, videoUuid: feedItem.video.videoUUID, userUuid: userSession.uuid, comment: text, createdOn: Date().getServerDate() , repliedTo: item.uuid)
        
        appSyncClient?.perform(mutation: CreateCommentMutation(createCommentInput: mutationInput), resultHandler: {
            (result, error) in
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
                    let comment = EPICAIComment(uuid: commentUuid, videoUUID: feedItem.video.videoUUID, userUUID: userSession.uuid, comment: text, createdOn:  Date().getServerDate(), repliedTo: item.uuid, modifiedOn: "")
                    var newCommentItem = EPICAICommentItem(comment: comment, user:userSession)
                    newCommentItem.userImage = EPICAIFileManager.shared().getEPICAIUserSessionImage()
                    completion(newCommentItem)
                    print("MUTATION - CREATE DATA : \(String(describing: result))")
                }
        })
    }
    
    func getComments(videoUUID: String) {
        var result = [EPICAICommentItem]()
        
        appSyncClient?.fetch(query: ListCommentbyVideoQuery(video_uuid: videoUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { comments, error in
            guard let comments = comments?.data?.listCommentbyVideo else { self.items = nil ; return }
            let group = DispatchGroup()
            for comment in comments {
                if let comment = comment {
                    group.enter()
                    appSyncClient?.fetch(query: GetUserQuery(user_uuid: comment.userUuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { user, error in
                        if let user = user?.data?.getUser {
                            if let imageURLString = user.imageUrl {
                                AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                                    if let imageURL = imageURL {
                                        do {
                                            let data = try Data(contentsOf: imageURL)
                                            var commentItem = EPICAICommentItem(comment: EPICAIComment(awsListComment: comment), user: EPICAIUser(awsListUser: user))
                                            commentItem.userImage = UIImage(data: data)
                                            result.append(commentItem)
                                            group.leave()
                                        } catch {
                                            let commentItem = EPICAICommentItem(comment: EPICAIComment(awsListComment: comment), user: EPICAIUser(awsListUser: user))
                                            result.append(commentItem)
                                            group.leave()
                                        }
                                    } else {
                                        let commentItem = EPICAICommentItem(comment: EPICAIComment(awsListComment: comment), user: EPICAIUser(awsListUser: user))
                                        result.append(commentItem)
                                        group.leave()
                                    }
                                }
                            }
                            else  {
                                let user = EPICAIUser(awsListUser: user)
                                let commnet = EPICAIComment(awsListComment: comment)
                                let item = EPICAICommentItem(comment: commnet, user: user)
                                result.append(item)
                                group.leave()
                            }
                        }
                    })
                }
            }
            group.notify(queue: .main) {
                var comments = result.filter { $0.comment.repliedTo == "null" ||  $0.comment.repliedTo.isEmpty }.sorted(by: { $0.commentDate! > $1.commentDate! })
                
                for (i, commentItem) in comments.enumerated() {
                    let replies = (result.filter{ $0.comment.repliedTo == commentItem.comment.uuid })
                    comments[i].replies =  replies.sorted(by: { $0.comment.createdOn > $1.comment.createdOn })
                }
                //self.items = result.filter { $0.comment.repliedTo == "null" ||  $0.comment.repliedTo.isEmpty }
                self.items = comments
            }
        })
    }
}
