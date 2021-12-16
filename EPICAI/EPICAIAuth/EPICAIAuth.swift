//
//  EPICAIAuth.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation

struct EPICAIAuthDetail : Codable {
    var logonUuid: String
    var userUuid: String
    var loginTime: String
    var oauthMethod: String
    
    init() {
        self.logonUuid = defaultText
        self.userUuid = defaultText
        self.loginTime = defaultText
        self.oauthMethod = defaultText
    }
}
