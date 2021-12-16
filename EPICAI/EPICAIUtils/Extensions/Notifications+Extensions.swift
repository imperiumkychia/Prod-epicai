//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation

extension Notification.Name {
    public static let userDidSignIn = Notification.Name("userDidSignIn")
    public static let userDidSignOut = Notification.Name("userDidSignOut")

    public static let didAskToDoAWSOperation = Notification.Name("didAskToDoAWSOperation")
    public static let didFinishAWSOperation = Notification.Name("didFinishAWSOperation")
    public static let didAskToDoReloadResultsTable = Notification.Name("didAskToDoReloadResultsTable")
    
    public static let userInfoUpdated = Notification.Name("userInfoUpdated")
    
    public static let didAddNewPublicVideo = Notification.Name("didAddNewPublicVideo")
    public static let didRenamePrivateVideo = Notification.Name("didRenamePrivateVideo")


}
