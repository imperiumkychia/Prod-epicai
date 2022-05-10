//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

/// Application define Model
/// Retriving data from API, GetUserQuery
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
    var followerCount:Int = defaultInt
    var followCount:Int = defaultInt
    var followStatus:Bool = defaultBool

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
        self.followerCount = awsListUser.followerCount ?? 0
        self.followCount = awsListUser.followCount ?? 0
        
        if let followStatus = awsListUser.followStatus, followStatus == 1 {
            self.followStatus = true
        }
        else {
            self.followStatus = false
        }
    }
    
    init(awsListUser:GetUserByEmailQuery.Data.GetUserByEmail) {
        self.uuid = awsListUser.userUuid ?? defaultText
        self.userName = awsListUser.username ?? defaultText
        self.firstName = awsListUser.firstName ?? defaultText
        self.lastName = awsListUser.lastName ?? defaultText
        self.email = awsListUser.email ?? defaultText
        self.vendorId = awsListUser.vendorUuid ?? defaultText
        self.vendor = awsListUser.vendor ?? defaultText
        self.imageUrl = awsListUser.imageUrl ?? defaultText
        self.gender = awsListUser.gender ?? defaultText
        self.followerCount = awsListUser.followerCount ?? 0
        self.followCount = awsListUser.followCount ?? 0
        
        if let followStatus = awsListUser.followStatus, followStatus == 1 {
            self.followStatus = true
        }
        else {
            self.followStatus = false
        }
    }
    
    init(awsSearchUser:ListSearchUserQuery.Data.ListSearchUser)  {
        self.uuid = awsSearchUser.userUuid ?? defaultText
        self.userName = awsSearchUser.username ?? defaultText
        self.firstName = awsSearchUser.firstName ?? defaultText
        self.lastName = awsSearchUser.lastName ?? defaultText
        self.email = awsSearchUser.email ?? defaultText
        self.vendorId = awsSearchUser.vendorUuid ?? defaultText
        self.vendor = awsSearchUser.vendor ?? defaultText
        self.imageUrl = awsSearchUser.imageUrl ?? defaultText
        self.gender = awsSearchUser.gender ?? defaultText
        self.followerCount = awsSearchUser.followerCount ?? 0
        self.followCount = awsSearchUser.followCount ?? 0
        
        if let followStatus = awsSearchUser.followStatus, followStatus == 1 {
            self.followStatus = true
        }
        else {
            self.followStatus = false
        }
    }
    
    init(awsFollower:ListFollowerQuery.Data.ListFollower)  {
        self.uuid = awsFollower.userUserUuid ?? defaultText
        self.userName = awsFollower.userUsername ?? defaultText
        self.firstName = awsFollower.userFirstName ?? defaultText
        self.lastName = awsFollower.userLastName ?? defaultText
        self.email = awsFollower.userEmail ?? defaultText
        self.vendorId = awsFollower.userVendorUuid ?? defaultText
        self.vendor = awsFollower.userVendor ?? defaultText
        self.imageUrl = awsFollower.userImageUrl ?? defaultText
        self.gender = awsFollower.userGender ?? defaultText
        self.followerCount = 0
        self.followCount = 0
        self.followStatus = false
    }
    
    init(awsFollowing:ListFollowingQuery.Data.ListFollowing)  {
        self.uuid = awsFollowing.followingUserUuid ?? defaultText
        self.userName = awsFollowing.followingUsername ?? defaultText
        self.firstName = awsFollowing.followingFirstName ?? defaultText
        self.lastName = awsFollowing.followingLastName ?? defaultText
        self.email = awsFollowing.followingEmail ?? defaultText
        self.vendorId = awsFollowing.followingVendorUuid ?? defaultText
        self.vendor = awsFollowing.followingVendor ?? defaultText
        self.imageUrl = awsFollowing.followingImageUrl ?? defaultText
        self.gender = awsFollowing.followingGender ?? defaultText
        self.followerCount = 0
        self.followCount = 0
        self.followStatus = true
    }
    
    init(awsOtherUserDetails:GetOtherUserProfileQuery.Data.GetOtherUserProfile)  {
        self.uuid = awsOtherUserDetails.userUuid ?? defaultText
        self.userName = awsOtherUserDetails.username ?? defaultText
        self.firstName = awsOtherUserDetails.firstName ?? defaultText
        self.lastName = awsOtherUserDetails.lastName ?? defaultText
        self.email = awsOtherUserDetails.email ?? defaultText
        self.vendorId = awsOtherUserDetails.vendorUuid ?? defaultText
        self.vendor = awsOtherUserDetails.vendor ?? defaultText
        self.imageUrl = awsOtherUserDetails.imageUrl ?? defaultText
        self.gender = awsOtherUserDetails.gender ?? defaultText
        self.followerCount = awsOtherUserDetails.followerCount ?? 0
        self.followCount = awsOtherUserDetails.followCount ?? 0
        
        if let followStatus = awsOtherUserDetails.followStatus, followStatus == 1 {
            self.followStatus = true
        }
        else {
            self.followStatus = false
        }
    }
    
    static func userListFromResult(awsSearchResult:[ListSearchUserQuery.Data.ListSearchUser?]) -> [EPICAIUser] {
        var users:[EPICAIUser] = []
        for user in awsSearchResult {
            if let user = user {
                users.append(EPICAIUser(awsSearchUser: user))
            }
        }
        return users
    }
    
    
    static func followersListFromResult(awsSearchResult:[ListFollowerQuery.Data.ListFollower?]) -> [EPICAIUser] {
        var users:[EPICAIUser] = []
        for user in awsSearchResult {
            if let user = user {
                users.append(EPICAIUser(awsFollower: user))
            }
        }
        return users
    }
    
    static func followingListFromResult(awsSearchResult:[ListFollowingQuery.Data.ListFollowing?]) -> [EPICAIUser] {
        var users:[EPICAIUser] = []
        for user in awsSearchResult {
            if let user = user {
                users.append(EPICAIUser(awsFollowing: user))
            }
        }
        return users
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
    
    /// Method define in Model
    /// Transform self attribute to query, CreateUserInput
    func createUserMutationInput() -> CreateUserInput {
        let createUserInput = CreateUserInput(userUuid: self.uuid, email: self.email, firstName: self.firstName, lastName: self.lastName, username: self.userName, vendor: self.vendor, vendorUuid: self.vendorId, imageUrl: self.imageUrl, gender: self.gender)
        return createUserInput
    }
}
