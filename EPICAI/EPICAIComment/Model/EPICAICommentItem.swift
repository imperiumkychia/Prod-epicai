//
//  EPICAICommentItem.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation
import UIKit

struct EPICAICommentItem {
    
    private var formatter = DateFormatter()
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    
    var comment:EPICAIComment
    var user:EPICAIUser
    var userImage:UIImage? = nil
    var replies:[EPICAIComment] = []
    var videoUUID:String = defaultText
    
    var commentDate: Date? {
        get {
            formatter.dateFormat = originalDateFormat
            return formatter.date(from: comment.createdOn)
        }
    }
    
    init(comment:EPICAIComment, user:EPICAIUser) {
        self.user = user
        self.comment = comment
    }
    
    init() {
        self.user = EPICAIUser()
        self.comment = EPICAIComment()
    }
}
