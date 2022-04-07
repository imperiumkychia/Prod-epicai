//
//  EPICAIAuthVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 07/01/22.
//

import Foundation
import Amplify
import UIKit

class EPICAIAuthVM  {
    
    var progressState = false
    var isUserExist = false
    var userLogedIn = false
    var userRegisterd = false
    
    let userLoginOperation = BlockOperation {
        
    }
    
    let userExistenceCheckOperation = BlockOperation {
        
    }
    
    let registerUserOperation = BlockOperation {
        
    }
    
    let userVMOperationQueue = OperationQueue()
    
    func performLogin() {
        userVMOperationQueue.maxConcurrentOperationCount = 1
        userVMOperationQueue.addOperation(userLoginOperation)
        userVMOperationQueue.addOperation(registerUserOperation)
        userLoginOperation.completionBlock  = {
            self.userVMOperationQueue.addOperation(self.userExistenceCheckOperation)
        }
    }
    
    func userLogin(provider:AuthProvider, completion:@escaping (Bool) -> Void) {
        if self.userExist() {
            
        }
        else {
            self.registerNewUser { state in
                if state {
                    self.manageUserSession(user: EPICAIUser())
                }
            }
        }
    }
    
    func userExist() -> Bool {
        //Check user exist or not
        return false
    }

    func registerNewUser(completion:@escaping (Bool) -> Void ) {
        completion(true)
    }
    
    func manageUserSession(user:EPICAIUser) {
        EPICAISharedPreference.userSession =  user
    }
}

enum UserLoginState {
    case authenticated
    case loggedIn
    case loginFailed
    case userExist
    case registerd
    case registrationFailed
}

class EPICAIUserLoginRecord {
    
    var userUUID:String
    var loginStatus:UserLoginState = .authenticated
    
    init(_ userUUId:String) {
        self.userUUID = userUUId
    }
}

class EPICUserLoginOperation:Operation {
    
    var loginRecord:EPICAIUserLoginRecord
    
    init(_ userLoginRecord:EPICAIUserLoginRecord) {
        self.loginRecord = userLoginRecord
    }
    
    override func main() {
        AuthService.shared().getCurrentUserUUID { (uuid) in
            if let uuid = uuid {
                appSyncClient?.fetch(query: GetUserQuery(user_uuid: uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
                    if error != nil {
                        self.loginRecord.loginStatus = .loginFailed
                    }
                    else if let _ = result?.errors {
                        self.loginRecord.loginStatus = .loginFailed
                    }
                    else {
                        if let user = result?.data?.getUser {
                            self.loginRecord.loginStatus = .loggedIn
                            self.manageUserSession(user:user)
                        }
                        else {
                            self.loginRecord.loginStatus = .userExist
                        }
                    }
                })
            }
            else {
                self.loginRecord.loginStatus = .loginFailed
            }
        }
    }
    
    func manageUserSession(user:GetUserQuery.Data.GetUser) {
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
}



