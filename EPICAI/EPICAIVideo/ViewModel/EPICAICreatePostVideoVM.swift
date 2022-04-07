//
//  EPICAIVideoVM.swift
//  EPICAI
//
//  Created by Abdul fattah on 20/12/21.
//

import Foundation
import Amplify
import CoreLocation
import SQLite

enum EPICAIUploadType {
    case Start
    case Video
    case BodyPoint
    case AudioPoint
    case Finish
}

enum EPICAIVideoPostError:Error {
    case USERUUIDNOTFOUND
    case VIDEOURLNOTFOUND
    case FailedToCreatePost
    case UploadFailed
}

class EPICAICreatePostVideoVM : NSObject {
    
    var progresType:EPICAIUploadType = .Start
    
    func uploadVideo(fileName:String,videoExtension:String, completion:@escaping ((Bool) -> Void)) {
        guard let videoLocalURl = EPICAIFileManager.shared().getVidioLocalURL(fileName: fileName + "." + videoExtension) else
        { completion(false); return }
        _ = Amplify.Storage.uploadFile(key: videoLocalURl.lastPathComponent, local: videoLocalURl, progressListener: { progress in
            self.progresType = .Video
        }, resultListener: { result in
            switch (result) {
            case .success(_):
                completion(true)
            case .failure(_):
                completion(true)
            }
        })
    }
    
    func uploadBodyPoint(fileName:String, completion:@escaping ((Bool) -> Void)) {
        guard let bodyPointsLocalURl = EPICAIFileManager.shared().getBodyPartsLocalURL(fileName: fileName)
        else { completion(false); return }
        _ = Amplify.Storage.uploadFile(key: bodyPointBucketkey + bodyPointsLocalURl.lastPathComponent, local: bodyPointsLocalURl, progressListener: { progress in
            self.progresType = .BodyPoint
        }, resultListener: { result in
            switch (result) {
                case .success( _): completion(true)
                case .failure(_): (completion(false))
            }
        })
    }
    
    func uploadAudioPoints(fileName:String, completion:@escaping ((Bool) -> Void)) {
        guard let audioLocalURl = EPICAIFileManager.shared().getAudioFileLocalURL(fileName: fileName)
        else { completion(false); return }
        _ = Amplify.Storage.uploadFile(key: audioPointBucketkey + audioLocalURl.lastPathComponent, local: audioLocalURl, progressListener: { progress in
            self.progresType = .AudioPoint
        }, resultListener: { result in
            switch (result) {
            case .success( _):
                self.progresType = .Finish
                completion(true)
            case .failure(_):
                completion(false)
            }
        })
    }
    
    func uploadVideoAndCSVFiles( fileName:String,videoExtension:String, completion:@escaping (Float?, EPICAIUploadType?, Error?) -> Void) {
        guard let videoLocalURl = EPICAIFileManager.shared().getVidioLocalURL(fileName: fileName + "." + videoExtension) else
        { completion(nil,nil,nil); return }
        
        _ = Amplify.Storage.uploadFile(key: videoLocalURl.lastPathComponent, local: videoLocalURl, progressListener: { progress in
            self.progresType = .Video
            completion(Float(progress.fractionCompleted),EPICAIUploadType.Video, nil)
        }, resultListener: { result in
            switch (result) {
            case .success( _):
                guard let bodyPointsLocalURl = EPICAIFileManager.shared().getBodyPartsLocalURL(fileName: fileName)
                else { completion(Float(100),EPICAIUploadType.Video,nil); return }
                
                _ = Amplify.Storage.uploadFile(key: bodyPointBucketkey + bodyPointsLocalURl.lastPathComponent, local: bodyPointsLocalURl, progressListener: { progress in
                    self.progresType = .BodyPoint
                    completion(Float(progress.fractionCompleted), EPICAIUploadType.BodyPoint, nil)
                }, resultListener: { result in
                    switch (result) {
                    case .success( _):
                        guard let audioLocalURl = EPICAIFileManager.shared().getAudioFileLocalURL(fileName: fileName)
                        else { completion(Float(100),EPICAIUploadType.AudioPoint,nil); return }
                        
                        _ = Amplify.Storage.uploadFile(key: audioPointBucketkey + audioLocalURl.lastPathComponent, local: audioLocalURl, progressListener: { progress in
                            self.progresType = .AudioPoint
                            completion(Float(progress.fractionCompleted), EPICAIUploadType.AudioPoint, nil)
                        }, resultListener: { result in
                            switch (result) {
                            case .success( _):
                                self.progresType = .Finish
                                completion(Float(100), EPICAIUploadType.Finish, nil)
                            case .failure(let error):
                                self.removeVideoIfUserDiscard(videoURL: videoLocalURl) { state, error in
                                    if let error = error {
                                        print("Video delete Error:\(error.localizedDescription)")
                                    }
                                }
                                self.removeBodyPointsCSVIfUserDiscard(bodyURL: bodyPointsLocalURl) { state, error in
                                    if let error = error {
                                        print("Body points delete Error:\(error.localizedDescription)")
                                    }
                                }
                                completion(nil, nil, error)
                            }
                        })
                    case .failure(let error):
                        self.removeVideoIfUserDiscard(videoURL: videoLocalURl) { state, error in
                            if let error = error {
                                print("Video delete Error:\(error.localizedDescription)")
                            }
                        }
                        completion(nil, nil, error)
                    }
                })
            case .failure(let error):
                completion(nil, nil, error)
            }
        })
    }
    
    func startFilesUpload(videoURL:URL, completion:@escaping ((Bool) -> Void)) {
        self.uploadVideoAndCSVFiles(fileName: videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: ""), videoExtension: videoURL.pathExtension) {(progress, uploadType, error) in
            if uploadType == .Finish {
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
    func getSWSS3VideoURL(videoURL:URL, completion:@escaping (URL?) -> Void) {
        self.getVideoS3URL(fileName: videoBucketkey + videoURL.lastPathComponent) { s3URL in
            completion(s3URL)
        }
    }
    
    func createVideoRecordWith(_ videoTitle:String, videoURL:URL, location:CLLocation?, completion:@escaping (Bool) -> Void) {
        let fileName = videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: "")
        self.uploadVideo(fileName: videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: ""), videoExtension: videoURL.pathExtension) { videoUploadState in
            if videoUploadState {
                self.uploadBodyPoint(fileName: fileName) { bodyPointsUploadState in
                    if bodyPointsUploadState {
                        self.uploadAudioPoints(fileName: fileName) { uploadAudioPointsState in
                            if uploadAudioPointsState {
                                self.getVideoS3URL(fileName: videoURL.lastPathComponent) { videoS3URL in
                                    if let videoS3URL = videoS3URL {
                                        if let userUUID = EPICAISharedPreference.userSession?.uuid {
                                            self.createAWSVideoRecord(userUUID: userUUID, s3URL: videoS3URL, videoURL: videoURL, videoTitle: videoTitle, location: location) { state in
                                                if (state) {
                                                    completion(true)
                                                }
                                                else {
                                                    completion(false)
                                                }
                                            }
                                        }
                                        else {completion(false)}
                                    }
                                    else {
                                        completion(false)
                                    }
                                }
                            }
                            else {
                                self.removeVideoIfUserDiscard(videoURL: videoURL) { (_,_) in }
                                self.removeBodyPointsCSVIfUserDiscard(bodyURL: videoURL) { (_,_) in }
                                completion(false)
                            }
                        }
                    }
                    else {
                        self.removeVideoIfUserDiscard(videoURL: videoURL) { (_,_) in }
                        completion(false)
                    }
                }
            }
            else {
                completion(false)
            }
        }
    }
    
    func createAWSVideoRecord(userUUID:String, s3URL:URL,videoURL:URL,videoTitle:String, location:CLLocation?, completion:@escaping (Bool) -> Void) {
        let s3location = (s3URL.host ?? "") + s3URL.path
        let createVideoInput = CreateVideoInput(videoUuid:videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: "") ,
                                                userUuid: userUUID,
                                                datetime: Date().getServerDate(),
                                                videoName: videoURL.lastPathComponent,
                                                videoSize: videoURL.getResourceSize(),
                                                videoInfo: videoURL.pathExtension,
                                                path: s3location,
                                                share: 0,
                                                videoDuration: videoURL.getDuration(),
                                                active: 1,
                                                uploadStatus: String(true),
                                                longitude:(location == nil) ? "" : String(location!.coordinate.latitude),
                                                latitude:(location == nil) ? "" : String(location!.coordinate.longitude),
                                                title: videoTitle)
        
        appSyncClient?.perform(mutation: CreateVideoMutation(createVideoInput: createVideoInput), resultHandler:  { result, error  in
            if let _ = error  { completion(false) ; self.progressDiscard(videoURL: videoURL) { _ in }
            } else if let _ = result?.errors { completion(false) ; self.progressDiscard(videoURL: videoURL) { _ in }
            } else { completion(true) }
        })
    }
    
    func createVideoRecord(videoTitle:String,videoURL:URL,location:CLLocation?, completion:@escaping (CreateVideoMutation.Data.CreateVideo?, Error?) -> Void) {
        self.startFilesUpload(videoURL: videoURL) { state in
            if (state) {
                let group = DispatchGroup()
                
                if let userUUID = EPICAISharedPreference.userSession?.uuid {
                    group.enter()
                    
                    self.getVideoS3URL(fileName: videoBucketkey + videoURL.lastPathComponent) { s3URL in
                        if let s3URL = s3URL {
                            let s3location = (s3URL.host ?? "") + s3URL.path
                            
                            let createVideoInput = CreateVideoInput(videoUuid:videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: "") ,
                                                                    userUuid: userUUID,
                                                                    datetime: Date().getServerDate(),
                                                                    videoName: videoURL.lastPathComponent,
                                                                    videoSize: videoURL.getResourceSize(),
                                                                    videoInfo: videoURL.pathExtension,
                                                                    path: s3location,
                                                                    share: 0,
                                                                    videoDuration: videoURL.getDuration(),
                                                                    active: 1,
                                                                    uploadStatus: String(true),
                                                                    longitude:(location == nil) ? "" : String(location!.coordinate.latitude),
                                                                    latitude:(location == nil) ? "" : String(location!.coordinate.longitude),
                                                                    title: videoTitle)
                            
                            appSyncClient?.perform(mutation: CreateVideoMutation(createVideoInput: createVideoInput), resultHandler:  { result, error  in
                                if let error = error  {
                                    completion(nil, error)
                                    group.leave()
                                    self.progressDiscard(videoURL: videoURL) { _  in }
                                } else if let resultError = result?.errors {
                                    completion(nil, resultError[0])
                                    group.leave()
                                    self.progressDiscard(videoURL: videoURL) { _ in }
                                }
                                else {
                                    completion(result?.data?.createVideo, nil)
                                    group.leave()
                                }
                            })
                        }
                        else {
                            completion(nil, EPICAIVideoPostError.VIDEOURLNOTFOUND)
                            group.leave()
                        }
                    }
                    group.notify(queue: .main) {
                        completion(nil, EPICAIVideoPostError.UploadFailed)
                    }
                }
                else {
                    completion(nil, EPICAIVideoPostError.USERUUIDNOTFOUND)
                }
            }
            else {
                completion(nil, EPICAIVideoPostError.UploadFailed)
            }
        }
    }
    
    func getVideoS3URL(fileName:String, completion:@escaping (URL?) -> Void ) {
        _ = Amplify.Storage.getURL(key: videoBucketkey + fileName, resultListener: { event in
            switch(event) {
            case .success(let url): completion(url)
            case .failure( _): completion(nil)
            }
        })
    }
    
    func progressDiscard(videoURL:URL, completion:@escaping (Bool) -> Void) {
        self.removeVideoIfUserDiscard(videoURL: videoURL) { state , error in
            if let error = error {
                print("Video delete error:\(error.localizedDescription)")
            }
        }
        
        guard let bodyPointsLocalURl = EPICAIFileManager.shared().getBodyPartsLocalURL(fileName: videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: "")) else { return }
        
        self.removeBodyPointsCSVIfUserDiscard(bodyURL: bodyPointsLocalURl) { state, error  in
            if let error = error {
                print("Body points csv delete error:\(error.localizedDescription)")
            }
        }
        
        guard let audioLocalURl = EPICAIFileManager.shared().getAudioFileLocalURL(fileName: videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: ""))
        else { return }
        
        
        self.removeAudioCSVIfUserDiscard(audioURL: audioLocalURl) { state, error in
            if let error = error {
                print("Audio points csv delete error:\(error.localizedDescription)")
            }
        }
    }
    
    func removeVideoIfUserDiscard(videoURL:URL, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: videoBucketkey + videoURL.lastPathComponent , resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeBodyPointsCSVIfUserDiscard(bodyURL:URL, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: bodyPointBucketkey + bodyURL.lastPathComponent, resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeAudioCSVIfUserDiscard(audioURL:URL, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: audioPointBucketkey + audioURL.lastPathComponent, resultListener: { result in
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

class EPICAIVideoRecordVM {
    
    let pendingOperations = EPICAIPendingOperations()
    var progressState = false
    var operationProgressReport :((EPICAIUploadRecord?, EPICAIOperation?, Error?) -> Void) = { _,_,_  in }
    
    func createVideoRecord(fileName:String, location:CLLocation?, videoURL:URL?) {
        
        var localURL:URL?
        var uploadRecord:EPICAIUploadRecord
        for i in 1...5 {
            if i == 1 {
                localURL = EPICAIFileManager.shared().getVidioLocalURL(fileName: fileName)
                uploadRecord = EPICAIUploadRecord(fileName: fileName, bucketKey: videoBucketkey, operationName: .Video, localURL: localURL, location: location)
                self.startOperation(for: uploadRecord, operationIndex: i)
            }
            if i == 2 {
                localURL =  EPICAIFileManager.shared().getBodyPartsLocalURL(fileName: fileName)
                uploadRecord = EPICAIUploadRecord(fileName: fileName, bucketKey: bodyPointBucketkey, operationName: .BodyPoint, localURL: localURL, location: location)
                self.startOperation(for: uploadRecord, operationIndex: i)
            }
            if i == 3 {
                localURL = EPICAIFileManager.shared().getAudioFileLocalURL(fileName: fileName)
                uploadRecord = EPICAIUploadRecord(fileName: fileName, bucketKey: audioPointBucketkey, operationName: .AudioPoint, localURL: localURL, location: location)
                self.startOperation(for: uploadRecord, operationIndex: i)
            }
            
            if i == 4 {
                uploadRecord = EPICAIUploadRecord(fileName: fileName, bucketKey: audioPointBucketkey, operationName: .AWSBucket, localURL: nil, location: location)
                self.startOperation(for: uploadRecord, operationIndex: i)
            }
            
            if i == 5 {
                uploadRecord = EPICAIUploadRecord(fileName: fileName, bucketKey: audioPointBucketkey, operationName: .CreateRecord, localURL: nil, location: location)
                self.startOperation(for: uploadRecord, operationIndex: i)
            }
        }
    }
    
    func startUploadOperation(_ uploadRecord:EPICAIUploadRecord, operationIndex:Int) {
        switch(uploadRecord.state) {
        case .new : startOperation(for: uploadRecord, operationIndex: operationIndex)
        case .uploaded: self.pendingOperations.uploadInProgress.removeValue(forKey: operationIndex)
        default : print("Do noting")
        }
    }
    
    func cancelDownloadInProgress() {
        self.pendingOperations.uploadQueue.isSuspended = true
    }
    
    func resumeAllUpload() {
        self.pendingOperations.uploadQueue.isSuspended = false
    }
    
    func cancelUpload() {
        self.pendingOperations.uploadQueue.cancelAllOperations()
    }
    
    func startOperation(for uploadRecord:EPICAIUploadRecord, operationIndex:Int) {
        let fileUploader = EPICAIUploadOperation(uploadRecord)
        self.progressState = true
        fileUploader.completionBlock = {
            if fileUploader.isCancelled {
                return
            }
            if fileUploader.uploadRecord.operationName == .Finish {
                self.progressState = false
            }
            if fileUploader.uploadRecord.error != nil {
                self.progressState = false
                self.pendingOperations.uploadQueue.cancelAllOperations()
                self.operationProgressReport(fileUploader.uploadRecord, fileUploader.uploadRecord.operationName, fileUploader.uploadRecord.error)
                
                self.startRemoveOperation(removeRecord: EPICAIRemoveRecord(fileName: fileUploader.uploadRecord.fileName, bucketKey: fileUploader.uploadRecord.bucketKey, operationName: fileUploader.uploadRecord.operationName))
            }
            DispatchQueue.main.async {
                self.pendingOperations.uploadInProgress.removeValue(forKey: operationIndex)
            }
        }
        self.pendingOperations.uploadInProgress[operationIndex] = fileUploader
        self.pendingOperations.uploadQueue.addOperation(fileUploader)
    }
    
    func startRemoveOperation(removeRecord:EPICAIRemoveRecord) {
        
        let removeRecordOperation = EPICAIRemoveFileOperation(removeRecord)
        
        if removeRecord.operationName == EPICAIOperation.BodyPoint {
            let removeVideoOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .Video))
            self.pendingOperations.removeFileQueue.addOperation(removeVideoOperation)
        }
        if removeRecord.operationName == EPICAIOperation.AudioPoint {
            //Remove video and bodypoints
            let removeVideoOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .Video))
            self.pendingOperations.removeFileQueue.addOperation(removeVideoOperation)
            
            let removeBodyPointsOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .BodyPoint))
            self.pendingOperations.removeFileQueue.addOperation(removeBodyPointsOperation)
        }
        
        if removeRecord.operationName == EPICAIOperation.AWSBucket {
            let removeVideoOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .Video))
            self.pendingOperations.removeFileQueue.addOperation(removeVideoOperation)
            
            let removeBodyPointsOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .BodyPoint))
            self.pendingOperations.removeFileQueue.addOperation(removeBodyPointsOperation)
            
            let removeAudioPointsOperation = EPICAIRemoveFileOperation(EPICAIRemoveRecord(fileName: removeRecord.fileName, bucketKey: videoBucketkey, operationName: .AudioPoint))
            self.pendingOperations.removeFileQueue.addOperation(removeAudioPointsOperation)
        }
        
        removeRecordOperation.completionBlock = {
            if removeRecordOperation.removeRecord.error != nil {
                print("Failed to remove file in operation \(removeRecordOperation.removeRecord.operationName) with error: \(String(describing: removeRecordOperation.removeRecord.error?.localizedDescription))")
            }
            else {
                print("File removed with operation : \(removeRecordOperation.removeRecord.operationName)")
            }
        }
    }
}

class EPICAIPendingOperations {
    
    lazy var uploadInProgress : [Int:Operation] = [:]
    
    lazy var uploadQueue : OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.name = "Video upload queue"
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
    
    lazy var removeInProgress : [Int:Operation] = [:]
    lazy var removeFileQueue : OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.name = "Remove asset queue"
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
}

enum EPICAIUploadState {
    case new, uploaded, failed, cancelled
}

enum EPICAIOperation {
    case Video
    case BodyPoint
    case AudioPoint
    case AWSBucket
    case CreateRecord
    case Finish
}

class EPICAIUploadRecord {
    let fileName: String
    var fractionUploaded: Float = 0.0
    var state = EPICAIUploadState.new
    var operationName:EPICAIOperation
    var error:Error?
    var bucketKey:String
    var localURL:URL?
    var awsBucketURL:URL?
    var location:CLLocation?
    
    init(fileName:String, bucketKey:String, operationName:EPICAIOperation, localURL:URL?, location:CLLocation?) {
        self.fileName = fileName
        self.bucketKey = bucketKey
        self.operationName = operationName
        self.localURL = localURL
        self.location = location
    }
}

class EPICAICreateVideoRecord : Operation {
    var record:EPICAIUploadRecord
    
    init(_ record: EPICAIUploadRecord) {
        self.record = record
    }
    
    override func main() {
        if self.isCancelled  { return }
    }
}

class EPICAIGetAWSUrl: Operation {
    
    var createPostRecord:EPICAIUploadRecord
    
    init(_ record:EPICAIUploadRecord) {
        self.createPostRecord = record
    }
    
    override func main() {
        if self.isCancelled { return }
        _ = Amplify.Storage.getURL(key: self.createPostRecord.bucketKey + self.createPostRecord.fileName, resultListener: { event in
            switch(event) {
            case .success( let url ):
                self.createPostRecord.awsBucketURL = url
                self.createPostRecord.operationName = .AWSBucket
            case .failure(let error):
                self.createPostRecord.awsBucketURL = nil
                self.createPostRecord.error = error
                self.createPostRecord.operationName = .AWSBucket
            }
        })
        if self.isCancelled { return }
    }
}

class EPICAIUploadOperation : Operation {
    
    let uploadRecord:EPICAIUploadRecord
    
    init(_ uploadRecord:EPICAIUploadRecord) {
        self.uploadRecord = uploadRecord
    }
    
    override func main() {
        _ = Amplify.Storage.uploadFile(key: self.uploadRecord.bucketKey + self.uploadRecord.fileName, local: self.uploadRecord.localURL!, progressListener: { progress in
            self.uploadRecord.fractionUploaded = Float(progress.fractionCompleted)
            
        }, resultListener: { result in
            switch (result) {
            case .success(_ ) :
                self.uploadRecord.fractionUploaded = 100.0
                self.uploadRecord.state = .uploaded
            case .failure(let error):
                self.uploadRecord.fractionUploaded = 0.0
                self.uploadRecord.error = error
                self.uploadRecord.state = .failed
            }
        })
    }
}

enum EPICAIRemoveStorageState {
    case new, removed, failed
}

class EPICAIRemoveRecord {
    
    let fileName: String
    var state = EPICAIRemoveStorageState.new
    var operationName:EPICAIOperation
    var error:Error?
    var bucketKey:String
    
    init(fileName:String, bucketKey:String, operationName:EPICAIOperation) {
        self.fileName = fileName
        self.bucketKey = bucketKey
        self.operationName = operationName
    }
}


class EPICAIRemoveFileOperation : Operation {
    
    let removeRecord:EPICAIRemoveRecord
    
    init(_ removeRecord:EPICAIRemoveRecord) {
        self.removeRecord = removeRecord
    }
    
    override func main() {
        
        if self.isCancelled {
            return
        }
        _ = Amplify.Storage.remove(key: self.removeRecord.bucketKey + self.removeRecord.fileName, resultListener: { event in
            switch(event) {
            case .success( _ ) : self.removeRecord.state = .removed
            case .failure(let error): self.removeRecord.error = error; self.removeRecord.state = .failed
            }
        })
        
        if self.isCancelled {
            return
        }
    }
}

