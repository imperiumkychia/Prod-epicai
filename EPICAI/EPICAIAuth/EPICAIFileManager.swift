//
//  EPICAIFileManager.swift
//  EPICAI
//
//  Created by Abdul fattah on 15/12/21.
//

import Foundation
import UIKit
import Vision
import AVKit
import CoreServices
import Photos
import AssetsLibrary


class EPICAIFileManager {
    
    var csvBodyPointWriter:CSVWriter?
    var csvAudioPointWriter:CSVWriter?
    
    var lastAudioLogDate = Date()
    var lastBodyPointsLogDate = Date()
    
    var writingInterval: Double {
        return Double(1.0 / Double(fps))
    }
    
    var bodyPoseFileName:String? {
        didSet {
            guard let fileName = self.bodyPoseFileName else {return}
            guard self.createBodyPartsCSVDirectory() else { return }
            guard let url = self.getCSVFilePathURL(fileName) else { return }
            guard let dataStream = OutputStream(toFileAtPath: url.path, append: false) else { return }
            do {
                self.csvBodyPointWriter =  try CSVWriter(stream: dataStream)
                let header = bodyPoseCSVHeader
                try csvBodyPointWriter?.write(row: header)
            } catch {
                print("Errror in file writing \(error.localizedDescription)")
            }
        }
    }
    
    var audioPointFileName:String? {
        didSet {
            guard let fileName = self.audioPointFileName else {return}
            guard self.createAudioCSVDirectory() else { return }
            guard let url = self.getAudioCSVFilePathURL(fileName) else { return }
            guard let dataStream = OutputStream(toFileAtPath: url.path, append: false) else { return }
            do {
                self.csvAudioPointWriter =  try CSVWriter(stream: dataStream)
                let header = audioCSVHeader
                try csvAudioPointWriter?.write(row: header)
            } catch {
                print("Errror in aduio file writing \(error.localizedDescription)")
            }
        }
    }
    
    var stopWritingBodyPause:Bool? {
        didSet {
            csvBodyPointWriter?.stream.close()
        }
    }
    
    class func shared() -> EPICAIFileManager {
        return sharedObject
    }
    
    private static var sharedObject: EPICAIFileManager = {
        return EPICAIFileManager()
    }()
    
    private init() {
    }
    
    
    class func cropVideo(sourceURL: URL, statTime:Float, endTime:Float, completion:@escaping ((URL?,Bool)->Void))
    {
        let manager = FileManager.default
        
        guard let documentDirectory = try? manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else {
            completion(nil,false)
            return
        }
        
        let mediaType = "mp4"
        if mediaType == kUTTypeMovie as String || mediaType == "mp4" as String {
            let asset = AVAsset(url: sourceURL as URL)
            let length = Float(asset.duration.value) / Float(asset.duration.timescale)
            print("video length: \(length) seconds")
            
            let start = statTime
            let end = endTime
            
            var outputURL = documentDirectory.appendingPathComponent("output")
            do {
                try manager.createDirectory(at: outputURL, withIntermediateDirectories: true, attributes: nil)
                outputURL = outputURL.appendingPathComponent("\(UUID().uuidString).\(mediaType)")
            }catch let error {
                print(error)
            }
            
            //Remove existing file
            _ = try? manager.removeItem(at: outputURL)
            
            
            guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality) else {return}
            exportSession.outputURL = outputURL
            exportSession.outputFileType = .mp4
            
            let startTime = CMTime(seconds: Double(start ), preferredTimescale: 1000)
            let endTime = CMTime(seconds: Double(end ), preferredTimescale: 1000)
            let timeRange = CMTimeRange(start: startTime, end: endTime)
            
            exportSession.timeRange = timeRange
            exportSession.exportAsynchronously{
                switch exportSession.status {
                case .completed:
                    completion(outputURL,true)
                    print("exported at \(outputURL)")
                case .failed:
                    completion(nil,false)
                    print("failed \(String(describing: exportSession.error))")
                    
                case .cancelled:
                    completion(nil,false)
                    print("cancelled \(String(describing: exportSession.error))")
                    
                default: completion(nil,false)
                }
            }
        }
        else {
            completion(nil, false)
        }
    }
    
    func cropVideo1(_ sourceURL1: URL, statTime:Float, endTime:Float){
        let videoAsset: AVAsset = AVAsset(url: sourceURL1) as AVAsset
        let composition = AVMutableComposition()
        composition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: CMPersistentTrackID())
        
        let videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = CGSize(width: 1280, height: 768)
        videoComposition.frameDuration = CMTimeMake(value: 8, timescale: 15)
        
        let instruction = AVMutableVideoCompositionInstruction()
        let length = Float(videoAsset.duration.value)
        print(length)
        
        instruction.timeRange = CMTimeRangeMake(start: CMTime.zero, duration: CMTimeMakeWithSeconds(60, preferredTimescale: 30))
        
        let start = statTime
        let end = endTime
        
        let exportSession = AVAssetExportSession(asset: videoAsset, presetName: AVAssetExportPresetHighestQuality)!
        exportSession.outputFileType = AVFileType.mp4
        
        let startTime = CMTime(seconds: Double(start ), preferredTimescale: 1000)
        let endTime = CMTime(seconds: Double(end ), preferredTimescale: 1000)
        let timeRange = CMTimeRange(start: startTime, end: endTime)
        
        exportSession.timeRange = timeRange
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        
        let date = Date()
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let outputPath = "\(documentsPath)/\(formatter.string(from: date)).mp4"
        let outputURL = URL(fileURLWithPath: outputPath)
        
        exportSession.outputURL = outputURL
        exportSession.outputFileType = AVFileType.mov
        print("sucess")
        exportSession.exportAsynchronously(completionHandler: { () -> Void in
            DispatchQueue.main.async(execute: {
                self.exportDidFinish(exportSession)
                print("sucess")
            })
        })
    }
    
    func exportDidFinish(_ session: AVAssetExportSession) {
        if session.status == AVAssetExportSession.Status.completed {
            if let outputURL = session.outputURL {
                DispatchQueue.main.async {
                    PHPhotoLibrary.shared().performChanges({
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputURL)
                    }) { saved, error in
                        if saved {
                            DispatchQueue.main.async {
                                print("Video saved successfully.")
                            }
                        }
                        if error != nil {
                            //os_log("Video did not save for some reason", error.debugDescription);
                            debugPrint(error?.localizedDescription ?? "error is nil");
                        }
                    }
                }
            }
        }
    }
    
    func manageDeleteVideoAndAssets(videoURL:URL) {
        _ = self.removeBodyPointsCSV(videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: ""))
        _ = self.removeAudioPointsCSV(videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: ""))
        EPICAIFileManager.removeVideoFile(atURL: videoURL) { state in
            print("Remove video state = \(state)")
        }
        self.deleteExtractedAudioFile()
    }
    
    func saveEPICAIUserSessionImage(image: UIImage) {
        let fileName = "EPICAIProfilePic.png"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.pngData() else { return }
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    func getEPICAIUserSessionImage() -> UIImage? {
        let named = "EPICAIProfilePic.png"
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    func filePathEPICAIUserSessionImage() -> URL? {
        let file = "EPICAIProfilePic.png"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            if FileManager.default.fileExists(atPath: fileURL.path) {
                return fileURL
            }
            return nil
        }
        return nil
    }
    
    func createBodyPartsCSVDirectory() -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("BodyPoints")
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        else {return true}
    }
    
    func createAudioCSVDirectory() -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        let docURL = URL(string: documentsDirectory)!
        let dataPath = docURL.appendingPathComponent("AudioPoints")
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        else {return true}
    }
    
    func audioPointsFileExist(fileName:String) -> Bool {
        if let fileURL = self.getAudioFileLocalURL(fileName: fileName) {
            if !FileManager.default.fileExists(atPath: fileURL.path) { return true }
            else { return false }
        }
        else {
            return false
        }
    }
    
    func bodyPointsFileExist(fileName:String) -> Bool {
        if let fileURL = self.getBodyPartsLocalURL(fileName: fileName) {
            if !FileManager.default.fileExists(atPath: fileURL.path) { return true }
            else { return false }
        }
        else {
            return false
        }
    }
    
    func getVidioLocalURL(fileName:String) -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        print("Video file URL : \(fileURL)")
        return fileURL
    }
    
    func getBodyPartsLocalURL(fileName:String) -> URL? {
        let dirName = "BodyPoints/\(fileName)"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(dirName).appendingPathExtension("csv")
        return fileURL
    }
    
    func getAudioFileLocalURL(fileName:String) -> URL? {
        let dirName = "AudioPoints/\(fileName)"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(dirName).appendingPathExtension("csv")
        return fileURL
    }
    
    func getCSVFilePathURL(_ fileName:String) -> URL? {
        let fileName = "BodyPoints/\(fileName)"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("csv")
        return fileURL
    }
    
    func getAudioCSVFilePathURL(_ fileName:String) -> URL? {
        let fileName = "AudioPoints/\(fileName)"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let fileURL = documentsDirectory.appendingPathComponent(fileName).appendingPathExtension("csv")
        return fileURL
    }
    
    func csvFileExist(_ name:String) -> Bool {
        if let fileURL = self.getCSVFilePathURL(name) {
            return FileManager.default.fileExists(atPath: fileURL.path)
        }
        return false
    }
    
    func csvAudioFileExist(_ name:String) -> Bool {
        if let fileURL = self.getAudioCSVFilePathURL(name) {
            return FileManager.default.fileExists(atPath: fileURL.path)
        }
        return false
    }
    
    func videoFileExist(_ name:String) -> Bool {
        if let fileURL = self.getVidioLocalURL(fileName: name) {
            return FileManager.default.fileExists(atPath: fileURL.path)
        }
        return false
    }
    
    func deleteExtractedAudioFile(fileName:String = extractedAudioFileName) {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let audioFileURL = fileURL?.appendingPathComponent(fileName)
        if let url = audioFileURL {
            do {
                try FileManager.default.removeItem(atPath: url.path)
            }
            catch {
                print("Error in extracted audio file :\(error.localizedDescription)")
            }
        }
    }
    
    func removeAudioPointsCSV(_ name:String) -> Bool {
        if let fileURL = self.getAudioCSVFilePathURL(name) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                return true
            }catch {
                print("Error in removeBodyPointsCSV \(error.localizedDescription)")
                return false
            }
        }
        else { return false }
    }
    
    func moveFileFromGallaryToLocalDirectory(fileName:String ,videoURL:URL) {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = url?.appendingPathComponent(fileName)
        guard let fileURL = fileURL else { return }
        do {
            if FileManager.default.fileExists(atPath: fileURL.path ) {
                try FileManager.default.removeItem(atPath: fileURL.path)
            }
            try FileManager.default.moveItem(atPath: videoURL.path, toPath: fileURL.path )
        } catch {
            print("Error in video move item :\(error.localizedDescription)")
        }
    }
    
    func saveGallryVideoInDocumentDirectory(fileName:String, _ videoURL:URL) -> URL? {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = url?.appendingPathComponent(fileName)
        guard let fileURL = fileURL else { return nil }
        do {
            let videoData = try Data(contentsOf: videoURL)
            FileManager.default.createFile(atPath: fileURL.path as String, contents: videoData, attributes: nil)
            return fileURL
        }
        catch {
            print("Error while save video in document directory :\(error.localizedDescription)")
            return nil
        }
    }
    
    func removeBodyPointsCSV(_ name:String) -> Bool {
        
        if let fileURL = self.getCSVFilePathURL(name) {
            do {
                try FileManager.default.removeItem(atPath:fileURL.path)
                return true
            }catch {
                print("Error in removeBodyPointsCSV \(error.localizedDescription)")
                return false
            }
        }
        else { return false }
    }
    
    func writeAudioPointsIntoCSV(volume:Int, closeFlasg:Bool, timeLapse:String) {
        if let _ = self.audioPointFileName {
            guard let cvsWriter = self.csvAudioPointWriter else { return }
            do {
                let nowDate = Date()
                if self.lastAudioLogDate.addingTimeInterval(writingInterval) <= nowDate {
                    self.lastAudioLogDate = nowDate
                    var csvRow:[String] = []
                    csvRow.append(timeLapse)
                    csvRow.append(String(volume))
                    print("CSV audio row \(csvRow)")
                    try cvsWriter.write(row: csvRow)
                }
                if closeFlasg { cvsWriter.stream.close() }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func writeBodyPointsInToCSV(pointDict:Dictionary<VNRecognizedPointKey, VNRecognizedPoint>, height:Int, width:Int, closeFlasg:Bool, timeLapse:String) {
        if let _ = self.bodyPoseFileName {
            guard let cvsWriter = self.csvBodyPointWriter else { return }
            do {
                let nowDate = Date()
                if self.lastBodyPointsLogDate.addingTimeInterval(writingInterval) <= nowDate {
                    self.lastBodyPointsLogDate = nowDate
                    print("Time lapse : \(timeLapse)")
                    var csvRow:[String] = []
                    // let date = Date()
                    // let timestamp = "\(date.getTime())"
                    
                    csvRow.append(timeLapse)
                    
                    let nosePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "head_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(nosePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(nosePoint.y).rounded(toPlaces: 3)))
                    
                    let neckPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "neck_1_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(neckPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(neckPoint.y).rounded(toPlaces: 3)))
                    
                    //Right
                    let rShoulderPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_shoulder_1_joint")]!.location,
                                                                         width,
                                                                         height)
                    csvRow.append(String(Double(rShoulderPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rShoulderPoint.y).rounded(toPlaces: 3)))
                    
                    let rElbowPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_forearm_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(rElbowPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rElbowPoint.y).rounded(toPlaces: 3)))
                    
                    let rwristPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_hand_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(rwristPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rwristPoint.y).rounded(toPlaces: 3)))
                    
                    //Left
                    let lShoulderPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_shoulder_1_joint")]!.location,
                                                                         width,
                                                                         height)
                    csvRow.append(String(Double(lShoulderPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lShoulderPoint.y).rounded(toPlaces: 3)))
                    
                    let lElbowPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_forearm_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(lElbowPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lElbowPoint.y).rounded(toPlaces: 3)))
                    
                    let lwristPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_hand_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(lwristPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lwristPoint.y).rounded(toPlaces: 3)))
                    
                    
                    let rootPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "root")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(rootPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rootPoint.y).rounded(toPlaces: 3)))
                    
                    //Right
                    let rHipPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_upLeg_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(rHipPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rHipPoint.y).rounded(toPlaces: 3)))
                    
                    let rKneePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_leg_joint")]!.location,
                                                                     width,
                                                                     height)
                    csvRow.append(String(Double(rKneePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rKneePoint.y).rounded(toPlaces: 3)))
                    
                    let rAnklePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_foot_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(rAnklePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rAnklePoint.y).rounded(toPlaces: 3)))
                    
                    
                    //Left
                    let lHipPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_upLeg_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(lHipPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lHipPoint.y).rounded(toPlaces: 3)))
                    
                    let lKneePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_leg_joint")]!.location,
                                                                     width,
                                                                     height)
                    csvRow.append(String(Double(lKneePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lKneePoint.y).rounded(toPlaces: 3)))
                    
                    let lAnklePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_foot_joint")]!.location,
                                                                      width,
                                                                      height)
                    csvRow.append(String(Double(lAnklePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lAnklePoint.y).rounded(toPlaces: 3)))
                    
                    
                    let lEyePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_eye_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(lEyePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lEyePoint.y).rounded(toPlaces: 3)))
                    let rEyePoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_eye_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(rEyePoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rEyePoint.y).rounded(toPlaces: 3)))
                    
                    let lEarPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "left_ear_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(lEarPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(lEarPoint.y).rounded(toPlaces: 3)))
                    let rEarPoint =  VNImagePointForNormalizedPoint(pointDict[VNRecognizedPointKey(rawValue: "right_ear_joint")]!.location,
                                                                    width,
                                                                    height)
                    csvRow.append(String(Double(rEarPoint.x).rounded(toPlaces: 3)))
                    csvRow.append(String(Double(rEarPoint.y).rounded(toPlaces: 3)))
                    
                    print("CSV Row \(csvRow)")
                    try cvsWriter.write(row: csvRow)
                }
                
                if closeFlasg { cvsWriter.stream.close() }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func removeVideoFile(atURL:URL, comletion:@escaping (Bool) -> Void) {
        if FileManager.default.fileExists(atPath: atURL.path) {
            do {
                try FileManager.default.removeItem(atPath: atURL.path)
                print("Removed file at path", atURL.path)
                comletion(true)
            } catch let removeError {
                print("couldn't remove file at path", removeError)
                comletion(false)
            }
        }
        else {
            comletion(true)
        }
    }
    
    func endCSVBodyPoseWriting() {
        guard let cvsWriter = self.csvBodyPointWriter else { return }
        cvsWriter.stream.close()
    }
    
    func export(_ asset: AVAsset, to outputMovieURL: URL, startTime: CMTime, endTime: CMTime, composition: AVVideoComposition) {
        
        //Create trim range
        let timeRange = CMTimeRangeFromTimeToTime(start: startTime, end: endTime)
        
        //delete any old file
        do {
            try FileManager.default.removeItem(at: outputMovieURL)
        } catch {
            print("Could not remove file \(error.localizedDescription)")
        }
        
        //create exporter
        let exporter = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetHighestQuality)
        
        //configure exporter
        exporter?.videoComposition = composition
        exporter?.outputURL = outputMovieURL
        exporter?.outputFileType = .mov
        exporter?.timeRange = timeRange
        
        //export!
        exporter?.exportAsynchronously(completionHandler: { [weak exporter] in
            DispatchQueue.main.async {
                if let error = exporter?.error {
                    print("failed \(error.localizedDescription)")
                } else {
                    print("Video saved to \(outputMovieURL)")
                }
            }
        })
    }
}


