//
//  EPICAINotificationVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/02/22.
//

import Foundation

/// Application define View Model.
/// Having responsibility to fetch result from the AWS AppSync API name is ListNotificationsQuery
/// Properties define under this class is, isExecuting, notificationItems, notificationItems
///
class EPICAINotificationVM {
    
    var isExecuting:Bool = false
    var notifyListUpdate:((Bool) -> Void) = { _ in }
    
    /// Description
    /// Notifiy controller when data get fetched.
    var notificationItems:[EPICAINotification] = [] {
        didSet {
            self.notifyListUpdate(true)
        }
    }
    
    /// This function is responsible to get data from the API name is ListNotificationsQuery
    /// Assign result into variable name is notificationItems
    /// Description
    func getNotification() {
        if isExecuting {return}
        if let query = EPICAINotification.getAllNotificationQuery() {
            self.isExecuting = true
            appSyncClient?.fetch(query: query,cachePolicy: .fetchIgnoringCacheData,resultHandler: { result, error in
                if let  _ = error { self.notificationItems = [] }
                else if let _  = result?.errors?[0] { self.notificationItems = [] }
                else {
                    let unSortedItems = EPICAINotification.notificationFromAWSQuery(awsItems: result?.data?.listNotifications)
                    let sorted = unSortedItems.sorted(by: { $0.dateTime > $1.dateTime })
                    self.notificationItems = sorted
                }
                self.isExecuting = false
            })
        }
    }
    
    /// Update read all status mark of a notification
    /// Not required any parameter
    func markReadAllNotifications(completion:@escaping (Bool) -> Void ) {
        if isExecuting { return }
        if let query = EPICAINotification.readAllNotificationQuery() {
            self.isExecuting = true
            appSyncClient?.fetch(query: query,cachePolicy: .fetchIgnoringCacheData,resultHandler: { result, error in
                if let _ = error { completion(false) }
                else if let _ = result?.errors?[0] { completion(false) }
                else {
                    var shortedItems = EPICAINotification.notificationFromAWSReadAllQuery(awsItems: result?.data?.readAllNotification)
                    shortedItems = shortedItems.sorted(by: { $0.dateTime > $1.dateTime })
                    self.notificationItems = shortedItems
                    completion( true)
                }
                self.isExecuting = false
            })
        }
    }
    
    /// Update read one item status mark of a notification
    /// Required EPICAINotification items as parameter.
    /// Acknowledge result state in side the controller.
    func markReadNotification(notification:EPICAINotification, completion:@escaping (Bool) -> Void) {
        self.isExecuting = true
        let  queryInput = EPICAINotification.toUpdateNotificationInput(notification: notification)
        appSyncClient?.perform(mutation: UpdateNotificationMutation(updateNotificationInput: queryInput), resultHandler: { result, error in
            if let _  = error { completion(false) }
            else if let _ = result?.errors?[0] { completion(false)}
            else { completion(true) }
            self.isExecuting = false
        })
    }
}
