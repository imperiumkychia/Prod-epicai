//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import KeychainAccess
import Amplify


class KeychainHandler: NSObject {
    
    class func shared() -> KeychainHandler {
        return sharedObject
    }
    
    private static var sharedObject: KeychainHandler = {
        return KeychainHandler()
    }()
    
    private var serviceKey: String = "com.ai2ar.auth.provider.service"
    private var providerKey: String = "auth_provider"
    
    private var keychain: Keychain {
        return Keychain(service: serviceKey)
    }
    
    func setAuthProvider(provider: AuthProvider) throws {
        
        do {
            switch provider {
            case .google:
                try keychain.set("Google", key: providerKey)
            case .facebook:
                try keychain.set("Facebook", key: providerKey)
            case .apple:
                try keychain.set("Apple", key: providerKey)
            default:
                try keychain.set("None", key: providerKey)
            }
        }
        
    }
    
    var authProvider: AuthProvider? {
        get {
            guard let string = keychain[providerKey] else { return nil }
            
            switch string {
            case "Google":
                return .google
            case "Facebook":
                return .facebook
            case "Apple":
                return .apple
            default:
                return .none
            }
            
        }
        
    }
}
