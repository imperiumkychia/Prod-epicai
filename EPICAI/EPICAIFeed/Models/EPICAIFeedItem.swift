//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit


let defaultText: String = ""
let defaultInt: Int = 0
let defaultBool:Bool = false
let defaultDouble:Double = 0.0
let defaultFloat:Float = 0.0


struct EPICAIFeedItem {
    private var formatter = DateFormatter()
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    
    var user: EPICAIUser
    var video: EPICAIVideo
    var videoLocalURL: URL? = nil
    var userImage: UIImage? = nil
    var userImageURL:URL? = nil
    var videoDate: Date? {
        get {
            formatter.dateFormat = originalDateFormat
            return formatter.date(from: video.dataTime)
        }
    }
    
    init(video: EPICAIVideo, user: EPICAIUser) {
        self.video = video
        self.user = user
    }
}


