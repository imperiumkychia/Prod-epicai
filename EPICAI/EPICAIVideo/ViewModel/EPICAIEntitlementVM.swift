//
//  EPICAIEntitlementVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/03/22.
//

import Foundation

class EPICAIEntitlementVM {
    
    var notifyVideoEntitlement:((EPICAIEntitlement) -> Void) = { _ in }
    
    var videoEntitlement:EPICAIEntitlement? {
        didSet {
            guard let videoEntitlement = videoEntitlement else { return }
            self.notifyVideoEntitlement(videoEntitlement)
        }
    }
    
    func getVideoEntitlementDetails() {
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else {return}
        appSyncClient?.fetch(query: GetEntitlementQuery(user_uuid: userUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let _ = error {
                self.videoEntitlement = EPICAIEntitlement(remainingSeconds: 0.0, displayRemaining: "")
            }
            else if let _ = result?.errors?[0] {
                self.videoEntitlement = EPICAIEntitlement(remainingSeconds: 0.0, displayRemaining: "")
            }
            else {
                guard let result = result?.data?.getEntitlement else { return }
                self.videoEntitlement = EPICAIEntitlement(awsVideoEntitlement: result)
            }
        })
    }
}
