//
//  EPICAIVideoVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 20/12/21.
//

import Foundation
import Amplify
import CoreLocation

enum UploadType {
    case Video
    case BodyPoint
    case AudioPoint
    case Finish
}

enum EPICAIVideoPostError:Error {
    case USERUUIDNOTFOUND
    case VIDEOURLNOTFOUND
    case FailedToCreatePost
}

class EPICAICreatePostVideoVM : NSObject {
    
    var showProgress :((Float?, UploadType?, Error?) -> Void) = { _,_,_  in }
    
    func uploadVideoAndCSVFiles( fileName:String) {
        
        guard let videoLocalURl = EPICAIFileManager.shared().getVidioLocalURL(fileName: fileName)else
        { self.showProgress(nil,nil,nil); return }
        guard let bodyPointsLocalURl = EPICAIFileManager.shared().getBodyPartsLocalURL(fileName: fileName)
        else { self.showProgress(nil,nil,nil); return }
        guard let audioLocalURl = EPICAIFileManager.shared().getAudioFileLocalURL(fileName: fileName)
        else { self.showProgress(nil,nil,nil); return }
        
        _ = Amplify.Storage.uploadFile(key: fileName, local: videoLocalURl, progressListener: { progress in
            self.showProgress(Float(progress.fractionCompleted),UploadType.Video, nil)
        }, resultListener: { result in
            switch (result) {
            case .success( _):
                _ = Amplify.Storage.uploadFile(key: bodyPoint + fileName, local: bodyPointsLocalURl, progressListener: { progress in
                    self.showProgress(Float(100), UploadType.BodyPoint, nil)
                }, resultListener: { result in
                    switch (result) {
                    case .success( _):
                        _ = Amplify.Storage.uploadFile(key: audioPoint + fileName, local: audioLocalURl, progressListener: { progress in
                            self.showProgress(Float(100), UploadType.AudioPoint, nil)
                        }, resultListener: { result in
                            switch (result) {
                            case .success( _):
                                self.showProgress(Float(100), UploadType.Finish, nil)
                            case .failure(let error):
                                self.removeVideoIfUserDiscard(videoUUID: fileName) { state, error in
                                    if let error = error {
                                        print("Video delete Error:\(error.localizedDescription)")
                                    }
                                    print("Video delete state in uploadVideoAndCSVFiles : \(state)")
                                }
                                self.removeBodyPointsCSVIfUserDiscard(csvBodyPointsUUID: fileName) { state, error in
                                    if let error = error {
                                        print("Body points delete Error:\(error.localizedDescription)")
                                    }
                                    print("Body points delete state in uploadVideoAndCSVFiles : \(state)")
                                }
                                self.showProgress(nil, nil, error)
                            }
                        })
                    case .failure(let error):
                        self.removeVideoIfUserDiscard(videoUUID: fileName) { state, error in
                            if let error = error {
                                print("Video delete Error:\(error.localizedDescription)")
                            }
                        }
                        self.showProgress(nil, nil, error)
                    }
                })
            case .failure(let error):
                self.showProgress(nil, nil, error)
            }
        })
    }
    
    func createVideoRecord(videoTitle:String,videoURL:URL,location:CLLocation, completion:@escaping (CreateVideoMutation.Data.CreateVideo?, Error?) -> Void) {
        if let userUUID = EPICAISharedPreference.userSession?.uuid {
            let videoUUID = UUID().uuidString
            //let videoURL = EPICAIFileManager.shared().getVidioLocalURL(fileName: videoURL.lastPathComponent)
            
            self.getS3URL(fileName: videoURL.lastPathComponent) { s3URL in
                if let s3URL = s3URL {
                    //let s3location = (s3URL.host ?? "") + s3URL.path
                    let createVideoInput = CreateVideoInput(videoUuid: videoUUID,
                                                            userUuid: userUUID,
                                                            datetime: Date().getServerDate(),
                                                            videoName: videoURL.lastPathComponent,
                                                            videoSize: videoURL.getResourceSize(),
                                                            videoInfo: videoURL.pathExtension,
                                                            path: s3URL.absoluteString,
                                                            share: 0,
                                                            videoDuration: videoURL.getDuration(),
                                                            active: 1,
                                                            uploadStatus: String(true),
                                                            commentsCount:0,
                                                            likesCount: 0,
                                                            longitude: String(location.coordinate.latitude),
                                                            latitude: String(location.coordinate.longitude),
                                                            title: videoTitle)
                    
                    appSyncClient?.perform(mutation: CreateVideoMutation(createVideoInput: createVideoInput), resultHandler:  { result, error  in
                        if let error = error  {
                            completion(nil, error)
                            self.progressDiscard(fileName: videoURL.lastPathComponent) { state in
                                print("File delete status in createVideoRecord:\(state)")
                            }
                        } else if let resultError = result?.errors {
                            completion(nil, resultError[0])
                            self.progressDiscard(fileName: videoURL.lastPathComponent) { state in
                                print("File delete status in createVideoRecord:\(state)")
                            }
                        }
                        else {
                            completion(result?.data?.createVideo, nil)
                        }
                    })
                }
                else {
                    completion(nil, EPICAIVideoPostError.VIDEOURLNOTFOUND)
                }
            }
        }
        else {
            completion(nil, EPICAIVideoPostError.USERUUIDNOTFOUND)
        }
    }
    
    func getS3URL(fileName:String, completion:@escaping (URL?) -> Void ) {
        _ = Amplify.Storage.getURL(key: fileName, resultListener: { event in
            switch(event) {
            case .success(let url): completion(url)
            case .failure( _): completion(nil)
            }
        })
    }
    
    func progressDiscard(fileName:String,completion:@escaping (Bool) -> Void) {
        self.removeVideoIfUserDiscard(videoUUID: fileName) { state , error in
            if let error = error {
                print("Video delete error:\(error.localizedDescription)")
            }
            print("Video delete state \(state)")
        }
        self.removeBodyPointsCSVIfUserDiscard(csvBodyPointsUUID: fileName) { state, error  in
            if let error = error {
                print("Body points csv delete error:\(error.localizedDescription)")
            }
            print("Body point scv delete state \(state)")
        }
        self.removeAudioCSVIfUserDiscard(csvAudioUUID: fileName) { state, error in
            if let error = error {
                print("Audio points csv delete error:\(error.localizedDescription)")
            }
            print("Audio csv delete state \(state)")
        }
    }
    
    func removeVideoIfUserDiscard(videoUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key:videoUUID , resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeBodyPointsCSVIfUserDiscard(csvBodyPointsUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: bodyPoint + csvBodyPointsUUID, resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeAudioCSVIfUserDiscard(csvAudioUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: csvAudioUUID, resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func saveLocalIfDiscaredUserDataUsages(fileNames:String, videoDetails:EPICAIVideo) {
        
    }
    
    func checkMaxVideoStorageStatus() -> Bool {
        return false
    }
    
}
