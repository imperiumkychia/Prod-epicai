//
//  EPICAIVideo.swift
//  EPICAI
//
//  Created by Abdul fattah on 12/01/22.
//

import Foundation
import CoreData
import SwiftUI
import Reachability
import CoreLocation

protocol TestP {
    associatedtype TestType
    var items:[TestType] { get set}
    mutating func add(item:TestType)
}

extension TestP {
    mutating func add(item:TestType) {
        self.items.append(item)
    }
}

class EPICAIOfflineVideoManager : NSObject {
    
    static var shared = EPICAIOfflineVideoManager()
    
    lazy var persistentContainer : NSPersistentContainer  =  {
        let container = NSPersistentContainer(name: "EPICAI")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error : \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror),\(nserror.userInfo)")
            }
        }
    }
    
     override init() { }
    
    func saveVideoRecord(epicVideo:EPICAIVideo) -> String? {
        if self.getDataStoreCount() > 2 {
            return "Maximum store limit accupied"
        }
        _ = NSEntityDescription.insertNewObject(forEntityName: "EPICAIVideoTable", into: self.persistentContainer.viewContext) as! EPICAIVideoTable
        _ = epicVideo.toManagedObject()
        self.saveContext()
        print("Video details:\(epicVideo)")
        return nil
    }
    
    func deleteRecordFromVideoTable(videoUUID:String)  {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EPICAIVideoTable")
        let predicate = NSPredicate(format: "videoUUID == %@", videoUUID)
        fetchRequest.predicate = predicate
        do {
            let videoItems = try self.persistentContainer.viewContext.fetch(fetchRequest) as! [EPICAIVideoTable]
            if let resultItem = videoItems.first {
                self.persistentContainer.viewContext.delete(resultItem)
            }
        }catch {
            print("Error while deleting video items: \(videoUUID)")
        }
    }
    
    func getDataStoreCount() -> Int {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EPICAIVideoTable")
            let result = try EPICAIOfflineVideoManager.shared.persistentContainer.viewContext.fetch(fetchRequest) as! [EPICAIVideoTable]
            return result.count
        }
        catch {
            print("Error during data count error:\(error.localizedDescription)")
            return 0
        }
    }
    
    func getAllOfflineRecord() -> [EPICAIVideo] {
        do {
            var records:[EPICAIVideo] = []
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EPICAIVideoTable")
            let result = try self.persistentContainer.viewContext.fetch(fetchRequest) as! [EPICAIVideoTable]
            result.forEach { videoManagedObject in
                records.append(EPICAIVideo().toVideoItem(videoManagedObject: videoManagedObject))
            }
            return records
        }catch {
            print("Error during fetch all offline records : \(error.localizedDescription)")
            return []
        }
    }
    
    func getStoreVideoRecord(videoUUID:String) -> EPICAIVideo? {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EPICAIVideoTable")
            let predicate = NSPredicate(format: "videoUUID == %@", videoUUID)
            fetchRequest.predicate = predicate
            let result  = try self.persistentContainer.viewContext.fetch(fetchRequest) as! [EPICAIVideoTable]
            if let itemFound = result.first {
                return EPICAIVideo().toVideoItem(videoManagedObject: itemFound)
            }
            else {
                return nil
            }
        }
        catch {
            print("Error in video data fetching : \(videoUUID)")
            return nil
        }
    }
    
    func uploadVideoRecordOnceWifiGetConnected() {
        let offlineStoreUploadOperation = OfflineStoreUploadOperation()
        offlineStoreUploadOperation.statrtOperation()
    }
}

class OfflineStoreUploadOperation {
    
    lazy var pendingOperaion:[Int:Operation] = [:]
    
    lazy var uploadQueue : OperationQueue = {
       let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "EPIC Upload queue"
        return queue
    }()
    
    func statrtOperation() {
        EPICAIOfflineVideoManager.shared.getAllOfflineRecord().forEach({ videoItem in
            let operation = EPICAIOfflineUploadOperation(epicVideo: videoItem)
            uploadQueue.addOperation(operation)
            operation.completionBlock = {
                print("Operation completed for video item : \(videoItem)")
            }
        })
    }
}

class EPICAIOfflineUploadOperation : Operation {
    
    var videoDetails:EPICAIVideo
    
    init(epicVideo:EPICAIVideo) {
        self.videoDetails = epicVideo
    }
    
    lazy var uploadQueue : OperationQueue = {
       let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.name = "EPIC Upload queue"
        return queue
    }()
    
    
    override func main() {
        let videoUpalodVM = EPICAICreatePostVideoVM()
        let location = CLLocation(latitude: Double(videoDetails.latitude) ?? 0.0, longitude: Double(videoDetails.longitude) ?? 0.0)
        guard let videoURL = URL(string: videoDetails.videoPath) else { return }
        
        videoUpalodVM.createVideoRecord(videoTitle: self.videoDetails.title, videoURL:videoURL, location: location , completion: { (createVideoDetails , error) in
            if error != nil {
                print("Video upload operation error:\(String(describing: error?.localizedDescription))")
            }
            else {
                EPICAIOfflineVideoManager.shared.deleteRecordFromVideoTable(videoUUID: self.videoDetails.videoUUID)
                EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: videoURL)
                print("Video upload operation success videoDetails:\(String(describing: createVideoDetails))")
            }
        })
    }
}



