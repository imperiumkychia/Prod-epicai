//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import Amplify
import AWSCognitoIdentityProvider
import AWSS3

class AWSManager: NSObject {
    
    class func shared() -> AWSManager {
        return sharedAWSManager
    }
    
    private static var sharedAWSManager: AWSManager = {
        return AWSManager()
    }()
    
    func downloadProfileImage(key: String, completion: @escaping (URL?) -> Void) {
        let downloadToFileName = FileManager.default.urls(for: .documentDirectory,
                                                          in: .userDomainMask)[0]
            .appendingPathComponent(key)
        
        if FileManager.default.fileExists(atPath: downloadToFileName.path) {
            completion(downloadToFileName)
            return
        }
        _ = Amplify.Storage.downloadFile(key: "profileImages/" + key, local: downloadToFileName,
            progressListener: { progress in
            }, resultListener: { event in
                switch event {
                case .success:
                    completion(downloadToFileName)
                case .failure(_):
                    completion(nil)
            }
        })
    }
    
    func uploadProfileImage(image: UIImage, key: String, completion: @escaping (Result<String,Error>) -> Void) {
        guard let data = image.pngData() else {
            completion(.failure(AWSError.imageDataError))
            return
        }
        //let options = StorageUploadDataRequest.Options(accessLevel: .protected, targetIdentityId: identityId, metadata: nil, contentType: nil, pluginOptions: nil)
        
        _ = Amplify.Storage.uploadData(key: "profileImages/" + key, data: data, resultListener: { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let message):
                completion(.success(message))
            }
        })
    }
    
    func downloadVideoFromURLString(urlString: String, completion: @escaping (String?) -> Void) {
        
        
    }
    
    func nameExistsOnS3(key: String, completion: @escaping (Result<Bool, StorageError>) -> Void) {
        Amplify.Storage.list() { event in
            switch event {
            case .failure(let error): completion(.failure(error))
            case .success(let results):
                let keys = results.items.map { $0.key }
                if keys.contains(key) { completion(.success(true))}
                else { completion(.success(false))}
            }
        }
    }
    
    func getURL(key: String, completion: @escaping (URL?) -> Void) {
        _ = Amplify.Storage.getURL(key: key) { event in
            switch event {
            case let (.success(url)):
                completion(url)
            case (.failure(_)):
                completion(nil)
            }
        }
    }
    
    func downloadVideo(key: String, completion: @escaping (URL?) -> Void) {
        let downloadToFileName = FileManager.default.urls(for: .documentDirectory,
                                                          in: .userDomainMask)[0]
            .appendingPathComponent(key)
        _ = Amplify.Storage.downloadFile(key: key, local: downloadToFileName,
            progressListener: { progress in
                /// If progress is needed
                
            }, resultListener: { event in
                switch event {
                case .success:
                    completion(downloadToFileName)
                case .failure(_):
                    completion(nil)
            }
        })
    }
    
    func renameVideo(key: String, localURL: URL, newKey: String, completion: @escaping (Bool) -> Void) {
        _ = Amplify.Storage.uploadFile(key: newKey, local: localURL) { (event) in
            switch event {
            case .success(_):
                self.removeVideo(key: key) { (succeeded) in
                    completion(true)
                }
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func removeLocalFileAt(url: URL) {
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            print("Unable to delete the temporary local file.")
        }
    }
    
    func renameLogForVideoWith(key: String, newKey: String) {
        let currentLogName = key.replacingOccurrences(of: ".mov", with: ".csv")
        let newLogName = newKey.replacingOccurrences(of: ".mov", with: ".csv")
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(currentLogName.replacingOccurrences(of: ".csv", with: "")).appendingPathExtension("csv")

        _ = Amplify.Storage.downloadFile(key: currentLogName, local: url,
            progressListener: { progress in
                /// If progress is needed
                
            }, resultListener: { event in
                switch event {
                case .success:
                    _ = Amplify.Storage.uploadFile(key: newLogName, local: url,
                        progressListener: { progress in
                            /// If progress is needed
                            
                        }, resultListener: { event in
                            switch event {
                            case .success:
                                self.removeLogForVideoWith(key: currentLogName)
                                self.removeLocalFileAt(url: url)
                            case .failure(_):
                                self.removeLocalFileAt(url: url)
                        }
                    })
                case .failure(_): break
            }
        })

    }

    func removeVideo(key: String, completion: @escaping (Bool) -> Void) {
        _ = Amplify.Storage.remove(key: key) { event in
            switch event {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func removeLogForVideoWith(key: String) {
        let logFileName = key.replacingOccurrences(of: ".mov", with: ".csv")
        _ = Amplify.Storage.remove(key: logFileName) { event in
            switch event {
            case .success(_): break
            case .failure(_): break
            }
        }
    }

    func signUp(username: String, password: String, email: String, completion: @escaping (Bool?, AuthSignUpStep?, AuthError?) -> Void) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        _ = Amplify.Auth.signUp(username: username, password: password, options: options) { result in
            switch result {
            case .success(let signUpResult):
                completion(signUpResult.isSignupComplete, signUpResult.nextStep, nil)
            case .failure(let error):
                completion(nil, nil, error)
            }
        }
    }
    
    func confirmSignUp(username: String, confirmationCode: String, completion: @escaping (Bool?, AuthError?) -> Void) {
        _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success(_):
                completion(true, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func fetchCurrentAuthSession(completion: @escaping (Bool) -> Void) {
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let session):
                if session.isSignedIn {
                    completion(true)
                } else {
                    completion(false)
                }
            case .failure(_):
                completion(false)
            }
        }
    }
    
    func signIn(username: String, password: String, completion: @escaping (Bool, AuthError?) -> Void) {
        _ = Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success(let status):
                if status.isSignedIn {
                    completion(true, nil)
                } else {
                    completion(false, nil)
                }
            case .failure(let error):
                completion(false, error)
            }
        }
    }
}

enum AWSError: Error {
    case s3Error
    case imageDataError
}
