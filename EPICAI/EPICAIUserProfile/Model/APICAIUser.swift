//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

struct EPICAIUser : Codable {
    
    var uuid:String = defaultText
    var userName:String = defaultText
    var firstName:String = defaultText
    var lastName:String = defaultText
    var email:String = defaultText
    var vendor:String = defaultText
    var vendorId:String = defaultText
    var imageUrl:String = defaultText
    var gender:String = defaultText

    
    init(userUUID:String) {
        self.uuid = userUUID
    }
    
    init(awsListUser:GetUserQuery.Data.GetUser) {
        self.uuid = awsListUser.userUuid ?? defaultText
        self.userName = awsListUser.username ?? defaultText
        self.firstName = awsListUser.firstName ?? defaultText
        self.lastName = awsListUser.lastName ?? defaultText
        self.email = awsListUser.email ?? defaultText
        self.vendorId = awsListUser.vendorUuid ?? defaultText
        self.vendor = awsListUser.vendor ?? defaultText
        self.imageUrl = awsListUser.imageUrl ?? defaultText
        self.gender = awsListUser.gender ?? defaultText
    }
    
    init() {
        self.uuid = defaultText
        self.userName = defaultText
        self.firstName = defaultText
        self.lastName = defaultText
        self.email = defaultText
        self.vendorId = defaultText
        self.vendor = defaultText
        self.imageUrl = defaultText
        self.gender = defaultText
    }
    
    func createUserMutationInput() -> CreateUserInput {
        let createUserInput = CreateUserInput(userUuid: self.uuid, email: self.email, firstName: self.firstName, lastName: self.lastName, username: self.userName, vendor: self.vendor, vendorUuid: self.vendorId, imageUrl: self.imageUrl, gender: self.gender)
        return createUserInput
    }
}
