//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit
import Amplify
import AWSPluginsCore
import Combine

class AuthService: NSObject {
    
    // MARK: Signleton
    class func shared() -> AuthService {
        return  sharedAuthService
    }
    
    private static var sharedAuthService: AuthService = {
        return AuthService()
    }()
    
    private override init() {
        
    }
    
    private var bkgQueue = DispatchQueue(label: "AuthServiceBackgroundQueue", qos: .background, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    static var currentUserFullName: String? = nil
    static var currentUserFirstName: String? = nil
    static var currentUserLastName: String? = nil
    static var currentUserGender: String? = nil
    static var currentUserImage: UIImage? = nil
    static var currentUserEmail: String? = nil
    static var currentUserUUID: String? = nil
    
    private var unsubscribeToken: UnsubscribeToken!
    
    static func updateCurrentUserAttributes() {
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserUUID { uid in
                currentUserUUID = uid
            }
        }
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserFullName { name in
                currentUserFullName = name
            }
        }
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserFirstName { fName in
                currentUserFirstName = fName
            }
        }
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserLastName { lName in
                currentUserLastName = lName
            }
            
        }
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserEmail { email in
                currentUserEmail = email
            }
        }
        
        AuthService.shared().bkgQueue.async {
            AuthService.shared().getCurrentUserGender { gender in
                currentUserGender = gender
            }
        }
        
        AuthService.shared().bkgQueue.async {
            let downloader = ImageGet()
            AuthService.shared().getCurrentUserPictureURL { (url) in
                if let url = url {
                    downloader.download(from: url) { (image) in
                        currentUserImage = image
                    }
                } else {
                    currentUserImage = nil
                }
            }
        }
    }
    
    // MARK: Methods
    
    func getIdToken(completion: @escaping (String?) -> Void) {
        _ = Amplify.Auth.fetchAuthSession { result in
            do {
                let session = try result.get()
                if let cognitoTokenProvider = session as? AuthCognitoTokensProvider {
                    let tokens = try cognitoTokenProvider.getCognitoTokens().get()
                    completion(tokens.idToken)
                } else {
                    completion(nil)
                }
                
            } catch {
                completion(nil)
            }
        }
    }
    
    func getCurrentUserUUID(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchAuthSession { result in
            do {
                let session = try result.get()
                // Get user sub
                if let identityProvider = session as? AuthCognitoIdentityProvider {
                    let usersub = try identityProvider.getUserSub().get()
                    completion(usersub)
                } else {
                    completion(nil)
                }
            } catch {
                completion(nil)
            }
        }
    }
    
    func getCurrentUserEmail(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                AuthService.currentUserEmail = nil
                completion(nil)
            case .success(let attrs):
                if let email = attrs.filter({$0.key == AuthUserAttributeKey.email}).first?.value {
                    AuthService.currentUserEmail = email
                    completion(email)
                } else {
                    AuthService.currentUserEmail = nil
                    completion(nil)}
            }
        }
    }
    
    func getCurrentUserFirstName(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                AuthService.currentUserFirstName = nil
                completion(nil)
            case .success(let attrs):
                if let name = attrs.filter({$0.key == AuthUserAttributeKey.givenName}).first?.value {
                    AuthService.currentUserFirstName = name
                    completion(name)
                } else {
                    AuthService.currentUserFirstName = nil
                    completion(nil)
                }
            }
        }
        
        /*
        AWSMobileClient.default().getUserAttributes { (attributes, error) in
            if let _ = error {
                completion("")
            } else if let attrs = attributes {
                if let email = attrs["name"] {
                    completion(email)
                } else{
                    completion("")
                }
            }
        }
        */
    }
    
    func getCurrentUserLastName(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                AuthService.currentUserLastName = nil
                completion(nil)
            case .success(let attrs):
                if let name = attrs.filter({$0.key == AuthUserAttributeKey.familyName}).first?.value {
                    AuthService.currentUserLastName = name
                    completion(name)
                } else {
                    AuthService.currentUserLastName = nil
                    completion(nil)}
            }
        }
    }
    
    func getCurrentUserGender(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                AuthService.currentUserGender = nil
                completion(nil)
            case .success(let attrs):
                if let gender = attrs.filter({$0.key == AuthUserAttributeKey.gender}).first?.value {
                    AuthService.currentUserGender = gender
                    completion(gender)
                } else {
                    AuthService.currentUserGender = nil
                    completion(nil)}
            }
        }
    }
    
    func getCurrentUserFullName(completion: @escaping (String?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                AuthService.currentUserFullName = nil
                completion(nil)
            case .success(let attrs):
                if let name = attrs.filter({$0.key == AuthUserAttributeKey.name}).first?.value {
                    AuthService.currentUserFullName = name
                    completion(name)
                } else {
                    AuthService.currentUserFullName = nil
                    completion(nil)}
            }
        }
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    func getCurrentUserPictureURL(completion: @escaping (URL?) -> Void) {
        Amplify.Auth.fetchUserAttributes() { result in
            switch result {
            case .failure(_):
                completion(nil)
            case .success(let attrs):
                if let attr = attrs.filter({$0.key == AuthUserAttributeKey.picture}).first {
                    if attr.key == AuthUserAttributeKey.picture {
                        /// If Google
                        if let url = URL(string: attr.value) {
                            completion(url)
                        } else if let body = self.convertStringToDictionary(text: attr.value) {
                            /// If Facebook
                            if let data = body["data"] as? NSDictionary {
                                if let str = data["url"] as? String, let url = URL(string: str) {
                                    completion(url)
                                } else { completion(nil) }
                            } else { completion(nil) }
                        } else { completion(nil) }
                    } else { completion(nil) }
                } else {
                    completion(nil)
                }
            }
        }
    }
    
    func performSignIn(provider: AuthProvider, in window: UIWindow, completion: @escaping (Result<AuthSignInResult, Error>) -> Void) {
        _ = Amplify.Auth.signInWithWebUI(for: provider, presentationAnchor: window, options: nil) { result in
            switch result {
            case .success(let authResult):
                NotificationCenter.default.post(name: .userDidSignIn, object: nil, userInfo: nil)
                AuthService.updateCurrentUserAttributes()
                completion(.success(authResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func performSignInWithApple(in window: UIWindow) {
        _ = Amplify.Auth.signInWithWebUI(for: .apple, presentationAnchor: window, options: nil) { [weak self] result in
            switch result {
            case .success(_):
                AuthService.updateCurrentUserAttributes()
                DispatchQueue.main.async {
                    self?.getCurrentUserEmail(completion: { (email) in
                        let message = ["email": email]
                        NotificationCenter.default.post(name: .userDidSignIn, object: nil, userInfo: message as [AnyHashable : Any])
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    AlertUser.alertUser(title: "Error", message: "\(error)", type: .error)
                }
            }
        }
            
    }
    
    func performSignInWithFacebook(in window: UIWindow) {
        
        _ = Amplify.Auth.signInWithWebUI(for: .facebook, presentationAnchor: window, options: nil) { [weak self] result in
            switch result {
            case .success(_):
                AuthService.updateCurrentUserAttributes()
                DispatchQueue.main.async {
                    self?.getCurrentUserEmail(completion: { (email) in
                        let message = ["email": email]
                        NotificationCenter.default.post(name: .userDidSignIn, object: nil, userInfo: message as [AnyHashable : Any])
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    AlertUser.alertUser(title: "Error", message: "\(error)", type: .error)
                }
            }
        }
            
    }
    
    func performSignInWithGoogle(in window: UIWindow) {
        
        _ = Amplify.Auth.signInWithWebUI(for: .google, presentationAnchor: window, options: nil) { [weak self] result in
            switch result {
            case .success(_):
                AuthService.updateCurrentUserAttributes()
                DispatchQueue.main.async {
                    self?.getCurrentUserEmail(completion: { (email) in
                        let message = ["email": email]
                        NotificationCenter.default.post(name: .userDidSignIn, object: nil, userInfo: message as [String : Any])
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    AlertUser.alertUser(title: "Error", message: "\(error)", type: .error)
                }
            }
        }
            
    }
    
    func signOut(triggerNotifications: Bool = true) {
        _ = Amplify.Auth.signOut(options: .init(globalSignOut: true, pluginOptions: nil), listener: {
            result in
            switch result {
            case .success:
                //AuthService.updateCurrentUserAttributes()
                if triggerNotifications {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .userDidSignOut, object: nil, userInfo: nil)
                    }
                }
            case .failure(let error):
                print("Unable to sign out: \(error)")
            }
        })
/*        _ = Amplify.Auth.signOut() {
            result in
            switch result {
            case .success:
                print("User signed out!")
                //AuthService.updateCurrentUserAttributes()
                if triggerNotifications {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .userDidSignOut, object: nil, userInfo: nil)
                    }
                }
            case .failure(let error):
                print("Unable to sign out: \(error)")
            }
        }*/
    }
}


