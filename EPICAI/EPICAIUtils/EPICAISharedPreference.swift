//
//  EPICAISharedPreference.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation

class EPICAISharedPreference : NSObject {
    
    static var userSession: EPICAIUser? {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) { UserDefaults.standard.set(encoded, forKey: "UserSession") }
            else { UserDefaults.standard.set(nil, forKey: "UserSession") }
        }
        get {
            if let userSessionData = UserDefaults.standard.data(forKey: "UserSession"),
               let userSession = try? JSONDecoder().decode(EPICAIUser.self, from: userSessionData) { return userSession }
            else { return nil }
        }
    }
}
