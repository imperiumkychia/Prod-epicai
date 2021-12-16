//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

enum AppStoryBoard : String {
    
    case Main, Comment, User, Video, Setting, EPICAuthStoryboard
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: .main)
    }
    
    func viewController <T :UIViewController> (viewController : T.Type) -> T {
        let storyboardID = (viewController as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}

extension UIViewController {
    
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryBoard(appStoryBoard : AppStoryBoard) -> Self {
        return appStoryBoard.viewController(viewController: self)
    }
    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}

extension UIViewController {
    
    func loadMainView() {
        performSegue(withIdentifier: Segues.showMainVC.rawValue, sender: self)
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "TABBAR_VC")
        mainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        mainVC.modalTransitionStyle = .crossDissolve
        self.present(mainVC, animated: true, completion: nil)
        */
    }
    
    func loadLoginView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "SignInNavigationController")
        loginVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        loginVC.modalTransitionStyle = .coverVertical
        self.present(loginVC, animated: true, completion: nil)
    }
}


extension UIViewController {
    func pushAccountViewController() {
        let toVC = EPICAIAccountVC()
        navigationController?.pushViewController(toVC, animated: true)
    }
//    
//    func pushSubscriptionViewController() {
//        let toVC = SubscriptionsViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
//    func pushFeedbackViewController() {
//        let toVC = FeedbackViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
//    func pushCommonQuestionViewController() {
//        let toVC = CommonQuestionViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
//    func pushContactUsViewController() {
//        let toVC = ContactUsViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
//    func pushEndUserAgreementViewController() {
//        let toVC = EndUserAgreementViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
//    func pushPrivacyPolicyViewController() {
//        let toVC = PrivacyPolicyViewController()
//        navigationController?.pushViewController(toVC, animated: true)
//    }
//    
}
