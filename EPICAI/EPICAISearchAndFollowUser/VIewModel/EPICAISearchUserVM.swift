//
//  EPICAISearchUserVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 04/02/22.
//

import Foundation

/// Application define View Model.
/// Having properties, isExecuting , notifyUserListUpdated, users
/// Having responsibility to follow/Unfollow state management, relative to other user.
class EPICAISearchUserVM  {
    
    var isExecuting = false
    var notifyUserListUpdated:(([EPICAIUser]) -> Void) = { _ in }
    var users:[EPICAIUser]  = [] {
        didSet {
            self.notifyUserListUpdated(users)
        }
    }
    
    /// This function is basicaly manage state Follow/Unfollow
    /// Based on current state it's behaviour is just opposite.
    /// Update it's response to controller
    /// Manage mutation CreateFollowMutation insert/delete from operation
    func performFollow(state:Bool, selectedUser:EPICAIUser, completion:@escaping (Bool) -> Void) {
        if self.isExecuting  { return }
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        self.isExecuting = true
        if (state) {
            let createFollowInput = CreateFollowInput(followUuid: UUID().uuidString, userUuid: userUUID, following: selectedUser.uuid)
            appSyncClient?.perform(mutation: CreateFollowMutation(createFollowInput: createFollowInput), resultHandler:  { result, error in
                if let _ = error {
                    self.isExecuting.toggle()
                    completion(false)
                }
                else if let _ = result?.errors?[0] {
                    self.isExecuting.toggle()
                    completion(false)
                }
                else {
                    self.isExecuting.toggle()
                    completion(true)
                }
            })
        }
        else {
            let deleteFollowMutation = DeleteFollowMutation(user_uuid: userUUID, following: selectedUser.uuid)
            appSyncClient?.perform(mutation: deleteFollowMutation, resultHandler:  { result, error in
                if let _ = error {
                    self.isExecuting.toggle()
                    completion(false)
                }
                else if let _ = result?.errors?[0] {
                    self.isExecuting.toggle()
                    completion(false)
                }
                else {
                    self.isExecuting.toggle()
                    completion(true)
                }
            })
        }
    }
    /// This function have responsibility to get search list from API name is ListSearchUserQuery
    /// Assign user list from result to property called users
    ///
    func getUsers(searchString:String) {
        if isExecuting { return }
        guard let userUUID = EPICAISharedPreference.userSession?.uuid else { return }
        isExecuting = true
        appSyncClient?.fetch(query: ListSearchUserQuery(name: searchString, user_uuid: userUUID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
            if let _  = error { self.isExecuting.toggle()}
            else if let _ = result?.errors?[0] { self.isExecuting.toggle()}
            else {
                guard let users = result?.data?.listSearchUser else { self.users = [] ; self.isExecuting.toggle() ; return }
                self.users = EPICAIUser.userListFromResult(awsSearchResult: users)
                self.isExecuting.toggle()
            }
        })
    }
    /// This function have responsibility to get search list from API name is ListFollowerQuery/ListFollowingQuery.
    /// Assign user list from result to property called users.
    /// Parameter it's take the state of query, Weather it is following list or followers list.
    func getUsers(isFollow:Bool, otherUser:EPICAIUser?) {
        if self.isExecuting { return }
        var userID:String = ""
        if let userUUID = otherUser?.uuid { userID = userUUID }
        else {
            guard let userUUID = EPICAISharedPreference.userSession?.uuid else  { return }
            userID = userUUID
        }
        //guard let userUUID = EPICAISharedPreference.userSession?.uuid else  { return }
        isExecuting = true
        if !isFollow {
            appSyncClient?.fetch(query: ListFollowerQuery(user_uuid: userID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
                if let _ = error { self.isExecuting.toggle() }
                else if let _ = result?.errors?[0] { self.isExecuting.toggle()  }
                else {
                    guard let users = result?.data?.listFollower else { self.users = [] ;self.isExecuting.toggle(); return }
                    self.users = EPICAIUser.followersListFromResult(awsSearchResult:users)
                    self.isExecuting.toggle()
                }
            })
        }
        else {
            appSyncClient?.fetch(query: ListFollowingQuery(user_uuid: userID), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
                if let _ = error { self.isExecuting.toggle() }
                else if let _ = result?.errors?[0] { self.isExecuting.toggle()  }
                else {
                    guard let users = result?.data?.listFollowing else { self.users = [] ; self.isExecuting.toggle() ; return }
                    self.users = EPICAIUser.followingListFromResult(awsSearchResult: users)
                    self.isExecuting.toggle()
                }
            })
        }
    }
}
