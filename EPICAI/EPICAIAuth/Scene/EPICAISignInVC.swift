//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit
import CryptoKit
import Amplify
import AWSCognitoIdentityProvider
import Security
import CryptoKit
import JGProgressHUD
import SnapKit

class EPICAISignInVC: UIViewController, AWSCognitoIdentityInteractiveAuthenticationDelegate {
    
    var scrollView: UIScrollView!
    var iconImageView: UIImageView!
    var appleLogoImageView: UIImageView!
    //var signupButton: UIButton!
    var signInWithGoogleButton: UIButton!
    var signInWithFacebookButton: UIButton!
    var signInWithAppleButton: UIButton!
    var stackView1: UIStackView!
    var stackView2: UIStackView!
    var message1Label: UILabel!
    var message2Label: UILabel!
    var message3Label: UILabel!
    
    let mainQueue = DispatchQueue.main
    
    var window: UIWindow {
        return self.view.window ?? UIWindow()
    }
    
    var fetchedAuthProvider: AuthProvider?
    var fetchedEmail: String?
    var fetchedFirstName: String?
    var fetchedLastName: String?
    var fetchedUsername: String?
    var fetchedUserUUID: String?
    var fetchedUserImageURL: URL?
    var fetchedGender: String?
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockAllTouches
        return indicator
    }()
    
    var waitTimer: Timer?
    
    let buttonImagePadding: CGFloat = 21.0
    let buttonHeight: CGFloat = 70.0
    
    var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userDidSignIn(_:)), name: .userDidSignIn, object: nil)
        setupUIElements(forOrientation: orientation)
        if let value = EPICAISharedPreference.displayTutorial, !value {
            DispatchQueue.main.async {
                let controller = EPICAITutorialVC.instantiateFromAppStoryBoard(appStoryBoard: .NotificationSB)
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true)
                EPICAISharedPreference.displayTutorial = true
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUIElements(forOrientation orientation: UIDeviceOrientation) {
        scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        iconImageView = UIImageView(image: UIImage(imageLiteralResourceName: "icon_trans.png"))
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        scrollView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(170.0)
            make.height.equalTo(75)
            make.centerX.equalTo(scrollView)
            make.top.equalTo(scrollView).offset(135.0)
        }
        
        appleLogoImageView = UIImageView(image: UIImage(systemName: "applelogo"))
        appleLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        appleLogoImageView.tintColor = .white
        appleLogoImageView.contentMode = .scaleAspectFill
        scrollView.addSubview(appleLogoImageView)
        appleLogoImageView.snp.makeConstraints { (make) in
            make.width.equalTo(66.0)
            make.height.equalTo(66.0)
            make.center.equalTo(scrollView)
        }
        
        signInWithAppleButton = UIButton(frame: .zero)
        signInWithAppleButton.translatesAutoresizingMaskIntoConstraints = false
        signInWithAppleButton.addTarget(self, action: #selector(signInWithAppleButtonTapped(_:)), for: .touchUpInside)
        signInWithAppleButton.setTitle(nil, for: .normal)
        scrollView.addSubview(signInWithAppleButton)
        signInWithAppleButton.snp.makeConstraints { (make) in
            make.edges.equalTo(appleLogoImageView)
        }
        
        message1Label = UILabel(frame: .zero)
        message1Label.translatesAutoresizingMaskIntoConstraints = false
        message1Label.textColor = .white
        message1Label.textAlignment = .center
        message1Label.font = LatoFont.bold.withSize(19.0)
        message1Label.text = "SIGN IN WITH"
        scrollView.addSubview(message1Label)
        message1Label.snp.makeConstraints { (make) in
            make.bottom.equalTo(appleLogoImageView.snp.top).offset(-20.0)
            make.centerX.equalTo(scrollView)
            make.top.equalTo(iconImageView.snp.bottom).offset(100.0).priority(250.0)
        }
        
        message2Label = UILabel(frame: .zero)
        message2Label.translatesAutoresizingMaskIntoConstraints = false
        message2Label.textColor = Palette.V2.v2_lightBlue
        message2Label.textAlignment = .center
        message2Label.font = LatoFont.regular.withSize(15.0)
        message2Label.text = "OR"
        scrollView.addSubview(message2Label)
        message2Label.snp.makeConstraints { (make) in
            make.top.equalTo(appleLogoImageView.snp.bottom).offset(32.0)
            make.centerX.equalTo(scrollView)
        }
        
        message3Label = UILabel(frame: .zero)
        message3Label.translatesAutoresizingMaskIntoConstraints = false
        message3Label.textColor = .white
        message3Label.textAlignment = .center
        message3Label.font = LatoFont.bold.withSize(17.0)
        message3Label.text = "CONTINUE WITH"
        scrollView.addSubview(message3Label)
        message3Label.snp.makeConstraints { (make) in
            make.top.equalTo(message2Label.snp.bottom).offset(32.0)
            make.centerX.equalTo(scrollView)
        }
        
        signInWithGoogleButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: buttonHeight, height: buttonHeight))
        signInWithGoogleButton.translatesAutoresizingMaskIntoConstraints = false
        signInWithGoogleButton.addTarget(self, action: #selector(signInWithGoogleButtonTapped(_:)), for: .touchUpInside)
        signInWithGoogleButton.backgroundColor = Palette.V2.v2_lightBlue
        signInWithGoogleButton.layer.cornerRadius = signInWithGoogleButton.bounds.height / 2.0
        signInWithGoogleButton.setImage(#imageLiteral(resourceName: "googleWhite"), for: .normal)
        signInWithGoogleButton.imageEdgeInsets = UIEdgeInsets(top: buttonImagePadding, left: buttonImagePadding, bottom: buttonImagePadding, right: buttonImagePadding)
        
        signInWithFacebookButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: buttonHeight, height: buttonHeight))
        signInWithFacebookButton.translatesAutoresizingMaskIntoConstraints = false
        signInWithFacebookButton.addTarget(self, action: #selector(signInWithFacebookButtonTapped(_:)), for: .touchUpInside)
        signInWithFacebookButton.backgroundColor = Palette.V2.v2_lightBlue
        signInWithFacebookButton.layer.cornerRadius = signInWithFacebookButton.bounds.height / 2.0
        signInWithFacebookButton.setImage(#imageLiteral(resourceName: "facebookWhite"), for: .normal)
        signInWithFacebookButton.imageEdgeInsets = UIEdgeInsets(top: buttonImagePadding, left: buttonImagePadding, bottom: buttonImagePadding, right: buttonImagePadding)
        
        stackView1 = UIStackView(arrangedSubviews: [signInWithGoogleButton, signInWithFacebookButton])
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.backgroundColor = .clear
        stackView1.axis = .horizontal
        stackView1.alignment = .center
        stackView1.distribution = .fillEqually
        stackView1.spacing = 10.0
        scrollView.addSubview(stackView1)
        stackView1.snp.makeConstraints { (make) in
            make.width.equalTo(2 * buttonHeight + stackView1.spacing)
            make.height.equalTo(buttonHeight)
            make.top.equalTo(message3Label.snp.bottom).offset(15.0)
            make.centerX.equalTo(scrollView)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        removeUIElements()
        setupUIElements(forOrientation: orientation)
    }
    
    private func removeUIElements() {
        if scrollView.superview != nil {
            scrollView.removeFromSuperview()
        }
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.loadMainView()
        }
    }
    
    @objc func userDidSignIn(_ notification: Notification) {
        DispatchQueue.main.async {
            //self.loadMainView()
        }
    }
    
    func manageSession(user:GetUserQuery.Data.GetUser) {
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
    
    func manageUserSession(uuid:String, userAuthProvider:AuthProvider) {
        appSyncClient?.fetch(query: GetUserQuery(user_uuid: uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if error != nil {
                print("Error in manageUserSession :\(String(describing: error?.localizedDescription))")
            }
            else if let errors = result?.errors {
                print("Error in manageUserSession :\(errors[0].localizedDescription)")
            }
            else {
                if let user = result?.data?.getUser {
                    self.manageSession(user: user)
                }
                else {
                    self.registerNewUser(authProvider: userAuthProvider, userUUID: uuid)
                }
            }
        })
    }
    
    func registerNewUser(authProvider: AuthProvider, userUUID:String) {
        var user = EPICAIUser()
        var userImageURL:URL?
        Amplify.Auth.fetchUserAttributes() { attributeResult in
            switch(attributeResult) {
            case .failure(let error): print("Error in fetchUserAttributes :\(error.localizedDescription)")
            case .success(let attributes):
                
                user.uuid = userUUID
                
                if let email = attributes.filter({$0.key == AuthUserAttributeKey.email}).first?.value
                { user.email = email } else { user.email = "" }
                
                if let name = attributes.filter({$0.key == AuthUserAttributeKey.name}).first?.value
                { user.userName = name } else { user.userName = "" }
                
                if let firstName = attributes.filter({$0.key == AuthUserAttributeKey.givenName}).first?.value
                { user.firstName = firstName } else { user.firstName = "" }
                
                if let lastName = attributes.filter({$0.key == AuthUserAttributeKey.familyName}).first?.value
                { user.lastName = lastName } else { user.lastName = "" }
                
                if let gender = attributes.filter({$0.key == AuthUserAttributeKey.gender}).first?.value
                { user.gender = gender } else { user.gender = "M" }
                
                if let attr = attributes.filter({$0.key == AuthUserAttributeKey.picture}).first {
                    if attr.key == AuthUserAttributeKey.picture {
                        /// If Google
                        if let url = URL(string: attr.value) {
                            userImageURL = url
                        } else if let body = AuthService.shared().convertStringToDictionary(text: attr.value) {
                            /// If Facebook
                            if let data = body["data"] as? NSDictionary {
                                if let str = data["url"] as? String, let url = URL(string: str) {
                                    userImageURL = url
                                } else { userImageURL = nil }
                            } else { userImageURL = nil }
                        } else { userImageURL = nil }
                    } else { userImageURL = nil }
                } else {
                    userImageURL = nil
                }
                switch authProvider {
                case .google:
                    user.vendor = "Google"
                    user.vendorId = "id_google"
                case .apple:
                    user.vendor = "Apple"
                    user.vendorId = "id_apple"
                case .facebook:
                    user.vendor = "Facebook"
                    user.vendorId = "id_facebook"
                default:
                    user.vendor = "Other"
                    user.vendorId = "id_other"
                }
                
                if let url = userImageURL {
                    let downloader = ImageGet()
                    downloader.download(from: url) { image in
                        if let userImage = image {
                            let imageKey = "profile_image__\(userUUID).png"
                            user.imageUrl = imageKey
                            AWSManager.shared().uploadProfileImage(image: userImage, key: imageKey) { result in
                                switch result {
                                case.failure( _):
                                    self.createUser(user: user, authProvider: authProvider)
                                case .success( _):
                                    self.createUser(user: user, authProvider: authProvider)
                                }
                            }
                        }
                        else {
                            self.createUser(user: user, authProvider: authProvider)
                        }
                    }
                }
                else {
                    self.createUser(user: user, authProvider: authProvider)
                }
            }
        }
    }
    
    func createUser(user:EPICAIUser, authProvider:AuthProvider) {
        appSyncClient?.perform(mutation: CreateUserMutation(createUserInput: user.createUserMutationInput()), resultHandler: { result, error in
            if error != nil {
                print("Error in createUser\(String(describing: error?.localizedDescription))")
            }
            else if result?.errors != nil {
                print("Error in createUser \(String(describing: result?.errors?[0].localizedDescription))")
            }
            else {
                DispatchQueue.main.async {
                    self.manageUserSession(uuid: user.uuid, userAuthProvider: authProvider)
                }
            }
        })
    }
    
    @objc func signInWithGoogleButtonTapped(_ sender: Any) {
        ai.textLabel.text = "Signing in..."
        ai.detailTextLabel.text = nil
        ai.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        ai.show(in: self.view, animated: true)
        AuthService.shared().performSignIn(provider: .google, in: window) { (result) in
            switch result {
            case .failure(let error):
                self.mainQueue.async {
                    self.ai.dismiss()
                    EPICAIGenericAlertView().show(title: "Error", message: "\(error)", onViewController: self, isShort: false) {}
                }
            case .success(let authResult):
                if authResult.isSignedIn {
                    AuthService.shared().getCurrentUserUUID { (uuid) in
                        if let uuid = uuid {
                            self.fetchedUserUUID = uuid
                            self.manageUserSession(uuid: uuid, userAuthProvider: .google)
                            DispatchQueue.main.async {
                                self.ai.dismiss()
                                guard let windowScene = self.view.window?.windowScene else { return }
                                let scene = UIApplication.shared.connectedScenes.first
                                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                    sd.setRootViewController(windowSceen: windowScene)
                                }
                            }
                        } else {
                            self.mainQueue.async {
                                self.ai.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func signInWithFacebookButtonTapped(_ sender: Any) {
        ai.textLabel.text = "Signing in..."
        ai.detailTextLabel.text = nil
        ai.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        ai.show(in: self.view, animated: true)
        AuthService.shared().performSignIn(provider: .facebook, in: window) { (result) in
            switch result {
            case .failure(let error):
                self.mainQueue.async {
                    self.ai.dismiss()
                    EPICAIGenericAlertView().show(title: "Error", message: "\(error)", onViewController: self, isShort: false) {}
                }
            case .success(let authResult):
                if authResult.isSignedIn {
                    AuthService.shared().getCurrentUserUUID { (uuid) in
                        if let uuid = uuid {
                            self.fetchedUserUUID = uuid
                            self.manageUserSession(uuid: uuid, userAuthProvider: .facebook)
                            DispatchQueue.main.async {
                                self.ai.dismiss()
                                guard let windowScene = self.view.window?.windowScene else { return }
                                let scene = UIApplication.shared.connectedScenes.first
                                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                    sd.setRootViewController(windowSceen: windowScene)
                                }
                            }
                        } else {
                            self.mainQueue.async {
                                self.ai.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
    
    @objc func signInWithAppleButtonTapped(_ sender: Any) {
        ai.textLabel.text = "Signing in..."
        ai.detailTextLabel.text = nil
        ai.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        ai.show(in: self.view, animated: true)
        AuthService.shared().performSignIn(provider: .apple, in: window) { (result) in
            switch result {
            case .failure(let error):
                self.mainQueue.async {
                    self.ai.dismiss()
                    EPICAIGenericAlertView().show(title: "Error", message: "\(error)", onViewController: self, isShort: false) {}
                    //AlertUser.alertUser(title: "Error", message: "\(error)", type: .error)
                }
            case .success(let authResult):
                if authResult.isSignedIn {
                    AuthService.shared().getCurrentUserUUID { (uuid) in
                        if let uuid = uuid {
                            self.fetchedUserUUID = uuid
                            self.manageUserSession(uuid: uuid, userAuthProvider: .apple)
                            DispatchQueue.main.async {
                                self.ai.dismiss()
                                guard let windowScene = self.view.window?.windowScene else { return }
                                let scene = UIApplication.shared.connectedScenes.first
                                if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                                    sd.setRootViewController(windowSceen: windowScene)
                                }
                            }
                        } else {
                            self.mainQueue.async {
                                self.ai.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
//    private func createUserLogin(uuid: String, provider: AuthProvider) {
//        let format = "yyyy-MM-dd HH:mm:ss"
//        let formatter = DateFormatter()
//        formatter.dateFormat = format
//        let now = Date()
//        _ = formatter.string(from: now)
//
//        var authMethod = ""
//        switch provider {
//        case .google:
//            authMethod = "G"
//        case .facebook:
//            authMethod = "FB"
//        case .apple:
//            authMethod = "APPL"
//        default:
//            authMethod = "other"
//        }
//
//        _ = UUID().uuidString
//
//        //        let userLogin = EPICAIUserLogin()
//        //        userLogin?.logonUuid = logon_UUID
//        //        userLogin?.userUuid = uuid
//        //        userLogin?.loginTime = loginTime
//        //        userLogin?.oauthMethod = authMethod
//        //
//        //
//        //        APIHandler.shared().createUserLogin(userLogin: userLogin!) { (_) in }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.showMainVC.rawValue {
            if let toVC = segue.destination as? TabBarViewController {
                toVC.modalPresentationStyle = .fullScreen
            }
        }
    }
}

