//
//  AdvanceSettingsModel.swift
//  EPICAI
//
//  Created by Abdul fattah on 15/02/22.
//

import Foundation

/// Application define advance setting model
/// Have properties like tourchState, poseTimerTime, feedLimit
struct AdvanceSettingsModel : Codable {
    
    var tourchState:Bool = defaultBool
    var poseTimerTime:Int = defaultInt
    var feedLimit:Int = defaultInt
    
    init(tocuhState:Bool, poseTimerTime:Int, feedLimit:Int) {
        self.tourchState = tocuhState
        self.poseTimerTime = poseTimerTime
        self.feedLimit = feedLimit
    }
}
