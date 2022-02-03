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
                print("State \(state)")
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
                        print("Error in manageUserSession :\(String(describing: error?.localizedDescription))")
                    }
                    else if let errors = result?.errors {
                        self.loginRecord.loginStatus = .loginFailed
                        print("Error in manageUserSession :\(errors[0].localizedDescription)")
                    }
                    else {
                        if let user = result?.data?.getUser {
                            self.loginRecord.loginStatus = .loggedIn
                            print("Manage user session :\(user) ")
                            self.manageUserSession(user:user)
                        }
                        else {
                            self.loginRecord.loginStatus = .userExist
                            //self.registerNewUser(authProvider: userAuthProvider, userUUID: uuid)
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



