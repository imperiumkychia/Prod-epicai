//
//  EPICAIEntitlement.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/03/22.
//

import Foundation

struct EPICAIEntitlement {
    var remainingSeconds:Double
    var displayRemaining:String
    
    init (remainingSeconds:Double,displayRemaining:String) {
        self.remainingSeconds = remainingSeconds
        self.displayRemaining = displayRemaining
    }
    init(awsVideoEntitlement:GetEntitlementQuery.Data.GetEntitlement?) {
        if let remainigSeconds = awsVideoEntitlement?.remainingSeconds {
            self.remainingSeconds = remainigSeconds
        }
        else {
            self.remainingSeconds = 0.0
        }
        if let displayRemaining = awsVideoEntitlement?.displayRemaining {
            self.displayRemaining = displayRemaining
        }
        else {
            self.displayRemaining = ""
        }
    }
}
