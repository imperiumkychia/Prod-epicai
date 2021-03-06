//
//  SceneDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import Reachability


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowSceen = (scene as? UIWindowScene) else { return }
        self.setRootViewController(windowSceen:windowSceen)
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    
    /// This method responsible to store login data, using API GetUserQuery.
    /// Also maintained store in preference(UserDefault)
    func manageUserSession(uuid:String) {
        appSyncClient?.fetch(query: GetUserQuery(user_uuid: uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let user = result?.data?.getUser {
                if let imageURLString = user.imageUrl {
                    AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                        if let imageURL = imageURL {
                            do {
                                let data = try Data(contentsOf: imageURL)
                                EPICAISharedPreference.userSession =  EPICAIUser(awsListUser: user)
                                if let image = UIImage(data: data) {
                                    EPICAIFileManager.shared().saveEPICAIUserSessionImage(image: image)
                                }
                            } catch {
                                EPICAISharedPreference.userSession =  EPICAIUser(awsListUser: user)
                            }
                        } else {
                            EPICAISharedPreference.userSession =  EPICAIUser(awsListUser: user)
                        }
                    }
                } else {
                    EPICAISharedPreference.userSession =  EPICAIUser(awsListUser: user)
                }
            }
        })
    }
    
    /// This method responsible to show the first controller.
    /// Checking wether user session retained
    func setRootViewController(windowSceen:UIWindowScene) {
        //window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
        let window = UIWindow(windowScene: windowSceen)
        
        if EPICAISharedPreference.userSession?.uuid != nil {
            let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
            window.rootViewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
            self.window = window
            self.window?.makeKeyAndVisible()
        }
        else {
            AuthService.shared().getCurrentUserUUID { token in
                DispatchQueue.main.sync {
                    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
                    if let userUUID = token {
                        let user = EPICAIUser(userUUID: userUUID)
                        EPICAISharedPreference.userSession = user
                        self.manageUserSession(uuid: userUUID)
                        window.rootViewController = storyboard.instantiateViewController(withIdentifier: "TabBarViewController")
                    }
                    else {
                        window.rootViewController = storyboard.instantiateViewController(withIdentifier: "EPICAISignInVC")
                    }
                    self.window = window
                    self.window?.makeKeyAndVisible()
                }
            }
        }
   }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        do {
            let hostName = "google.com"
            let reachability = try Reachability(hostname: hostName)
            if reachability.connection == .wifi {
                // let offlineOperation = OfflineStoreUploadOperation()
                // offlineOperation.statrtOperation()
            }
            reachability.whenReachable = { reachability in
                switch(reachability.connection) {
                case .wifi: break
                default : break
                }
            }
        }
        catch {
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

