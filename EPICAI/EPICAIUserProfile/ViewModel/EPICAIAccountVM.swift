//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

class EPICAIAccountVM: NSObject {
    
    private var _userItem: EPICAIUserAccountItem!
    var onReceiveUserInfo: ((EPICAIUserAccountItem?) -> Void) = { _ in }
    
    private(set) var userItem: EPICAIUserAccountItem? {
        didSet {
            onReceiveUserInfo(userItem)
        }
    }
    
    override init() {
        super.init()
    }
    
    func getUserInfo() {
        AuthService.shared().getCurrentUserUUID { (uuid) in
            if let uuid = uuid {
                appSyncClient?.fetch(query: GetUserQuery(user_uuid: uuid), cachePolicy: .fetchIgnoringCacheData, resultHandler: { result, error in
                    if let user = result?.data?.getUser {
                        if let imageURLString = user.imageUrl {
                            AWSManager.shared().downloadProfileImage(key: imageURLString) { imageURL in
                                if let imageURL = imageURL {
                                    do {
                                        let data = try Data(contentsOf: imageURL)
                                        self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: UIImage(data: data))
                                    } catch {
                                        self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                                    }
                                } else {
                                    self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                                }
                            }
                        } else {
                            self.userItem = EPICAIUserAccountItem(user: EPICAIUser(awsListUser: user), userImage: nil)
                        }
                    }
                })
            }
        }
       // guard let uid = AuthService.currentUserUUID else { return }
    }
    
    func updateUser(user: EPICAIUser, completion: @escaping (Error?) -> Void) {
        let userUpdateMutaionInput = UpdateUserInput(userUuid: user.uuid, email: user.email, firstName: user.firstName, lastName: user.lastName, username: user.userName, vendor: user.vendor, vendorUuid: user.vendorId, imageUrl: user.imageUrl, gender: user.gender)
        
        appSyncClient?.perform(mutation: UpdateUserMutation(updateUserInput: userUpdateMutaionInput), resultHandler: { result, error in
            completion(error)
        })
    }
    
    func uploadProfileImage(image: UIImage, key: String, completion: @escaping (Error?) -> Void) {
        AWSManager.shared().uploadProfileImage(image: image, key: key) { result in
            switch result {
            case .failure(let error):
                print("Error uploading image to S3: \(error)")
                completion(error)
            case .success(let message):
                print("Uploaded image to S3: \(message)")
                completion(nil)
            }
        }
    }
}

struct EPICAIUserAccountItem {
    
    var user: EPICAIUser
    var userImage: UIImage? = nil
    
    init(user: EPICAIUser, userImage: UIImage?) {
        self.user = user
        self.userImage = userImage
    }
}
