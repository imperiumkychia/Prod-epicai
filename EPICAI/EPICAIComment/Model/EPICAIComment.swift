//
//  EPICAIComment.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation

struct EPICAIComment {
    var uuid:String
    var videoUUID:String
    var userUUID:String
    var comment:String
    var createdOn:String
    var repliedTo:String
    var modifiedOn:String
    
    init() {
        self.uuid = defaultText
        self.videoUUID = defaultText
        self.userUUID = defaultText
        self.comment = defaultText
        self.createdOn = defaultText
        self.repliedTo = defaultText
        self.modifiedOn = defaultText
    }
    
    init(awsListComment:ListCommentsQuery.Data.ListComment) {
        self.uuid = awsListComment.commentUuid
        self.videoUUID = awsListComment.videoUuid
        self.userUUID = awsListComment.userUuid
        self.comment = awsListComment.comment
        self.createdOn = awsListComment.createdOn ?? ""
        self.repliedTo = awsListComment.repliedTo ?? ""
        self.modifiedOn = awsListComment.modifiedOn ?? ""
    }
    
    init(uuid:String,videoUUID:String,userUUID:String,comment:String,createdOn:String,repliedTo:String,modifiedOn:String) {
        self.uuid = uuid
        self.videoUUID = videoUUID
        self.userUUID = userUUID
        self.comment = comment
        self.createdOn = createdOn
        self.repliedTo = repliedTo
        self.modifiedOn = modifiedOn
    }
}
