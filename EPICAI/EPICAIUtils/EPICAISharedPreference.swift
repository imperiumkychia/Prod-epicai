//
//  EPICAISharedPreference.swift
//  EPICAI
//
//  Created by Abdul fattah on 11/12/21.
//

import Foundation

class EPICAISharedPreference : NSObject {
    
    static var advanceSetting:AdvanceSettingsModel? {
        set {
            if newValue == nil { UserDefaults.standard.set(nil, forKey: "AdvanceSettingsModel") }
            else {
                if let encoded = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.set(encoded, forKey: "AdvanceSettingsModel") }
                else { UserDefaults.standard.set(nil, forKey: "AdvanceSettingsModel") }
            }
        }
        get {
            if let userSessionData = UserDefaults.standard.data(forKey: "AdvanceSettingsModel"),
               let userSession = try? JSONDecoder().decode(AdvanceSettingsModel.self, from: userSessionData) { return userSession }
            else { return nil }
        }
    }
    
    static var userSession: EPICAIUser? {
        set {
            if newValue == nil {
                UserDefaults.standard.set(nil, forKey: "UserSession")
            }
            else {
                if let encoded = try? JSONEncoder().encode(newValue)
                { UserDefaults.standard.set(encoded, forKey: "UserSession") }
                else { UserDefaults.standard.set(nil, forKey: "UserSession") }
            }
        }
        get {
            if let userSessionData = UserDefaults.standard.data(forKey: "UserSession"),
               let userSession = try? JSONDecoder().decode(EPICAIUser.self, from: userSessionData) { return userSession }
            else { return nil }
        }
    }
    
    static var displayTutorial:Bool? {
        set {
            if newValue == nil { UserDefaults.standard.set(true, forKey: "displayTutorial") }
            else {
                UserDefaults.standard.set(newValue, forKey: "displayTutorial")
            }
        }
        get {
            return  UserDefaults.standard.bool(forKey: "displayTutorial")
        }
    }
}
