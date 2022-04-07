//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import Amplify
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin
import AWSAPIPlugin
import AWSAppSync

var appSyncClient: AWSAppSyncClient?

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.add(plugin: AWSAPIPlugin())
            Amplify.Logging.logLevel = .info
            try Amplify.configure()
            //print("Amplify configured with Storage, API and Cognito plugins")
        } catch {
            //print("Failed to initialize Amplify with \(error)")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            if EPICAISharedPreference.advanceSetting?.tourchState == nil && EPICAISharedPreference.advanceSetting?.poseTimerTime == nil {
                let advanceSettings  = AdvanceSettingsModel(tocuhState: true, poseTimerTime: 5, feedLimit: 10)
                EPICAISharedPreference.advanceSetting = advanceSettings
            }
            self.configureAmplify()
            
            let cacheConfiguration = try AWSAppSyncCacheConfiguration()
            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig(),
                                                                  cacheConfiguration: cacheConfiguration)
            // initialize app sync client
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
            
            appSyncClient?.apolloClient?.cacheKeyForObject = { $0["id"] }
            
            //self.setRootViewController()
            //print("AppSyncClient initialized with cacheConfiguration: \(cacheConfiguration)")
        } catch {
            //print("Error initializing AppSync client. \(error)")
        }
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

