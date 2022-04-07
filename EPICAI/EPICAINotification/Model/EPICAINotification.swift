//
//  EPICAINotification.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/02/22.
//

import Foundation

/// Application define Model
/// Responsible to collect data from, ListNotificationsQuery
/// Localize properties and response to display application notification.
struct EPICAINotification {
    
    var id:String = defaultText
    var title:String = defaultText
    var message:String = defaultText
    var dateTime:String = defaultText
    var status:Bool = defaultBool
    
    init(awsNotificationList:ListNotificationsQuery.Data.ListNotification) {
        self.id = awsNotificationList.notificationUuid ?? defaultText
        self.title = awsNotificationList.title ?? defaultText
        self.message = awsNotificationList.message ?? defaultText
        self.dateTime = awsNotificationList.datetime ?? defaultText
        if let status = awsNotificationList.status, status == 1 { self.status = true}
        else { self.status = false }
    }
    
    init(awsNotificationList:ReadAllNotificationQuery.Data.ReadAllNotification) {
        self.id = awsNotificationList.notificationUuid ?? defaultText
        self.title = awsNotificationList.title ?? defaultText
        self.message = awsNotificationList.message ?? defaultText
        self.dateTime = awsNotificationList.datetime ?? defaultText
        if let status = awsNotificationList.status, status == 1 { self.status = true}
        else { self.status = false }
    }
    
    static func toUpdateNotificationInput(notification:EPICAINotification) -> UpdateNotificationInput {
        let updateQuery = UpdateNotificationInput(notificationUuid: notification.id, status: "1")
        return updateQuery
    }
    
    static func notificationFromAWSReadAllQuery(awsItems:[ReadAllNotificationQuery.Data.ReadAllNotification?]?) -> [EPICAINotification] {
        guard let awsItems = awsItems else { return [] }
        var items:[EPICAINotification] = []
        for item in awsItems {
            if let newItem = item {
                items.append(EPICAINotification(awsNotificationList: newItem))
            }
        }
        return items
    }
    
    static func notificationFromAWSQuery(awsItems:[ListNotificationsQuery.Data.ListNotification?]?) -> [EPICAINotification] {
        guard let awsItems = awsItems else { return [] }
        var items:[EPICAINotification] = []
        for item in awsItems {
            if let newItem = item {
                items.append(EPICAINotification(awsNotificationList: newItem))
            }
        }
        return items
    }
    
    static func readAllNotificationQuery () -> ReadAllNotificationQuery? {
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return nil}
        let readAllQuery = ReadAllNotificationQuery(user_uuid: userUUID)
        return readAllQuery
    }
    
    static func getAllNotificationQuery () -> ListNotificationsQuery? {
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return nil}
        let listAllQuery = ListNotificationsQuery(user_uuid: userUUID)
        return listAllQuery
    }

}
