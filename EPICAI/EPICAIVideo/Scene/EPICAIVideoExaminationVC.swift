//
//  EPICAIVideoExaminationVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 22/01/22.
//

import UIKit
import AVFoundation
import Player
import CDAlertView
import Vision
import JGProgressHUD
import SQLite

var frameExtractionPerSecond = 5

class EPICAIVideoExaminationVC: UIViewController {
    
    let mainQueue = DispatchQueue.main
    
    private var playButtonContainer: UIView!
    var closeButton: UIButton!
    private var playButton: UIButton!
    
    var player:Player = Player()
    var videoURL:URL?
    var documentDirURl:URL?
    
    var fileUUID = UUID().uuidString
    
    var audioFrames:[Float] = []
    var numberOfTasks = 0
    let videoProcessingQueue = OperationQueue()
    
    var ai: JGProgressHUD = {
        var indicator = JGProgressHUD(style: .light)
        indicator.indicatorView = JGProgressHUDPieIndicatorView()
        indicator.textLabel.text = "Video Processing"
        indicator.detailTextLabel.text = "0% Complete"
        return indicator
    }()
    
    private func preparePlayer() {
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.view.bounds
        self.player.fillMode = .resizeAspectFill
        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
    }
    
    @IBAction func playButtonClicked(_ sender : UIButton) {
        self.togglePlayPause()
    }
    
    private func togglePlayPause() {
        if player.playbackState == .playing {
            player.pause()
        } else {
            player.playFromCurrentTime()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.closeButton.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.player.stop()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.createNewRecordFiles(fileName: self.fileUUID)
        self.player.url = videoURL
        player.playFromCurrentTime()
        self.extractImagesFromVideo()
    }
    
    func createNewRecordFiles(fileName:String) {
        let _ = EPICAIFileManager.shared().removeBodyPointsCSV(fileName)
        let _ = EPICAIFileManager.shared().removeAudioPointsCSV(fileName)
        
        EPICAIFileManager.shared().bodyPoseFileName = fileName
        EPICAIFileManager.shared().audioPointFileName = fileName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preparePlayer()
        self.setUpUI()
       // guard let videoURL = self.videoURL else {return}
       // self.documentDirURl = EPICAIFileManager.shared().saveGallryVideoInDocumentDirectory(fileName: "\(self.fileUUID).\(videoURL.pathExtension)", videoURL)
        //EPICAIFileManager.shared().moveFileFromGallaryToLocalDirectory(fileName: "\(self.fileUUID).\(videoURL.pathExtension)", videoURL: videoURL)
    }
    
    @objc private func didTapOnPlay(_ sender: UIButton) {
        if player.playbackState == .playing {
            player.pause()
        } else {
            player.playFromCurrentTime()
        }
    }
    
    private func setUpUI() {
        playButtonContainer = UIView(frame: .zero)
        playButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        playButtonContainer.backgroundColor = .white.withAlphaComponent(0.2)
        playButtonContainer.layer.cornerRadius = 50.0
        self.view.addSubview(playButtonContainer)
        
        playButton = UIButton(frame: .zero)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(#imageLiteral(resourceName: "playFeed"), for: .normal)
        let imageInset: CGFloat = 35.0
        playButton.imageEdgeInsets = UIEdgeInsets(top: imageInset, left: imageInset, bottom: imageInset, right: imageInset)
        playButton.addTarget(self, action: #selector(didTapOnPlay(_:)), for: .touchUpInside)
        playButtonContainer.addSubview(playButton)
        
        let buttonCornerRadius: CGFloat = 20.0
        
        let closeButtonCornerRadius: CGFloat = buttonCornerRadius + 5.0
        closeButton = UIButton(frame: .zero)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22.0, weight: .regular)), for: .normal)
        closeButton.tintColor = Palette.V2.V2_cameraVCCloseButtonTint
        closeButton.backgroundColor = Palette.V2.V2_cameraVCCloseButtonBackground
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        closeButton.layer.cornerRadius = closeButtonCornerRadius
        closeButton.layer.shadowColor = UIColor.black.cgColor
        closeButton.layer.shadowOffset = .zero
        closeButton.layer.shadowRadius = 10.0
        closeButton.layer.shadowOpacity = 0.3
        view.addSubview(closeButton)
        
        closeButton.snp.makeConstraints { (make) in
            make.height.equalTo(closeButtonCornerRadius * 2.0)
            make.width.equalTo(closeButtonCornerRadius * 2.0)
            make.centerY.equalTo(100)
            make.trailing.equalTo(view).offset(-50.0)
        }
        
        playButtonContainer.snp.makeConstraints { (make) in
            make.width.equalTo(playButtonContainer.layer.cornerRadius * 2.0)
            make.height.equalTo(playButtonContainer.layer.cornerRadius * 2.0)
            make.center.equalTo(view.center)
        }
        
        playButton.snp.makeConstraints { (make) in
            make.edges.equalTo(playButtonContainer)
        }
    }
    
    @objc private func toggleMovieRecording(_ recordButton: UIButton) {
        self.togglePlayPause()
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.showAlertWithOption()
    }
    
    func showAlertWithOption() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Are you sure you wants to abort the video process? Press yes, to exit the video processing", type: .alarm)
        
        let doneAction = CDAlertViewAction(title: "Yes", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            self.navigationController?.popViewController(animated: true)
            
            return true
        }
        let cancelAction = CDAlertViewAction(title: "No", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            return true
        }
        
        alert.circleFillColor = Palette.darkPurple
        doneAction.buttonTextColor = Palette.darkPurple
        cancelAction.buttonTextColor = Palette.darkPurple
        
        alert.add(action: doneAction)
        alert.add(action: cancelAction)
        alert.show()
    }
    
    var imageFramesCount = 0
    
    func abortVideoProcessingOperations() {
        self.videoProcessingQueue.cancelAllOperations()
        self.imageFramesCount = 0
        self.audioFrames = []
    }
    
    func incrementInProgress(tasks: Int) {
        mainQueue.async {
            if tasks == 0 {
                self.ai.dismiss(animated: true)
                self.navigateToComposePostView()
            }
            else {
                if tasks < 99 {
                    self.ai.setProgress(Float((100.0 - Float(tasks))/100.0), animated: true)
                    self.ai.detailTextLabel.text = "\(Float(100 - tasks)) completed"
                }
                else if tasks > 100 {
                    self.ai.setProgress(Float((Float(tasks) - 100.0)/100.0), animated: true)
                    self.ai.detailTextLabel.text = "\(Float(tasks - 100)) completed"
                }
                else if tasks == 100 {
                    self.ai.setProgress(0.0, animated: true)
                    self.ai.detailTextLabel.text = "\(Float(tasks - 100)) completed"
                }
            }
        }
    }
    
    func navigateToComposePostView() {
        let postVideoVC = EPICAIComposePost.instantiateFromAppStoryBoard(appStoryBoard: .VPStoryboard)
        guard let videoURL = self.documentDirURl else {return}
        postVideoVC.videoURL = videoURL
        //postVideoVC.fileName = self.fileUUID
        self.navigationController?.pushViewController(postVideoVC, animated: true)
    }
    
    func extractImagesFromVideo() {
        
        guard let videoURL = self.videoURL else { return }
        
        DispatchQueue.main.async {
            self.ai.show(in: self.view)
        }
        
        videoProcessingQueue.maxConcurrentOperationCount = 1
        
        let videoWriteOperation = WriteVideoInDocumentDirectory(videoURL: videoURL,fileName: "\(self.fileUUID).\(videoURL.pathExtension)")
        videoProcessingQueue.addOperation(videoWriteOperation)
        
        videoWriteOperation.completionBlock = {
            
            self.documentDirURl = videoWriteOperation.localURL
            
            let audioProcessOperation = ExtractAudioOperation(videoURL: videoURL)
            
            self.videoProcessingQueue.addOperation(audioProcessOperation)
            
            audioProcessOperation.completionBlock = {
                self.numberOfTasks = self.numberOfTasks - 1
                self.incrementInProgress(tasks: self.numberOfTasks)
                self.audioFrames = audioProcessOperation.audioFrames
                self.performImageExtraction()
            }
        }
    }
    
    func performImageExtraction() {
        guard let videoURL = self.videoURL else { return }
                
        let fileUrl  = NSURL(fileURLWithPath: videoURL.path)
        let asset = AVURLAsset(url: (fileUrl as URL), options: nil)
        let videoDuration = asset.duration
        
        let generator = AVAssetImageGenerator(asset: asset)
        generator.requestedTimeToleranceBefore = .zero
        generator.requestedTimeToleranceAfter = .zero
        
        var frameForTimes = [NSValue]()
        let sampleCounts = Int(videoDuration.seconds)*frameExtractionPerSecond
        self.numberOfTasks = sampleCounts + 1
        //print("Sample count: \(sampleCounts)")
        let totalTimeLength = Int(videoDuration.seconds * Double(videoDuration.timescale))
        //print("Video duration :\(totalTimeLength)")
        let step = totalTimeLength / sampleCounts
        
        for i in 0 ..< sampleCounts {
            let cmTime = CMTimeMake(value: Int64(i * step), timescale: Int32(videoDuration.timescale))
            frameForTimes.append(NSValue(time: cmTime))
        }
        
        generator.generateCGImagesAsynchronously(forTimes: frameForTimes, completionHandler: {requestedTime, image, actualTime, result, error in
            DispatchQueue.main.async {
                if let image = image {
                    self.imageFramesCount += 1
                    print(requestedTime.value, requestedTime.seconds, actualTime.value)
                    
                    var audioDecibleValue:Float = 0.0
                    if ((videoURL.getDuration().rounded(toPlaces: 2)) - requestedTime.seconds) < 1 {
                        self.numberOfTasks = self.imageFramesCount
                    }
                    if self.audioFrames.count > self.imageFramesCount-1 {
                        audioDecibleValue = self.audioFrames[self.imageFramesCount-1]
                    }
                    let operation = ProcessImages(cgImage: image, timelapse:requestedTime.seconds.stringFromTimeInterval(), auidoPower: audioDecibleValue)
                    
                    self.videoProcessingQueue.addOperation(operation)
                    
                    operation.completionBlock = {
                        if ((videoURL.getDuration().rounded(toPlaces: 2)) - requestedTime.seconds) < 1 {
                            if self.numberOfTasks > 0 {
                                operation.closeFlag = true
                                self.numberOfTasks = 0
                                self.incrementInProgress(tasks: 0)
                            }
                        }
                        else {
                            self.numberOfTasks -= 1
                            self.incrementInProgress(tasks: self.numberOfTasks)
                        }
                    }
                }
            }
        })
    }
}

extension EPICAIVideoExaminationVC : PlayerPlaybackDelegate {
    
    func playerCurrentTimeDidChange(_ player: Player) {}
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {}
    
    func playerPlaybackDidEnd(_ player: Player) {}
    
    func playerPlaybackWillLoop(_ player: Player) {}
    
    func playerPlaybackDidLoop(_ player: Player) {}
}

extension EPICAIVideoExaminationVC : PlayerDelegate {
    
    func playerReady(_ player: Player) {}
    
    func playerPlaybackStateDidChange(_ player: Player) {}
    
    func playerBufferingStateDidChange(_ player: Player) {}
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {}
    
    func player(_ player: Player, didFailWithError error: Error?) {}
}

extension AVAsset {
    
    func writeAudioTrackToURL(_ url: URL, completion: @escaping (Bool, Error?) -> ()) {
        do {
            let audioAsset = try self.audioAsset()
            audioAsset.writeToURL(url, completion: completion)
        } catch (let error as NSError){
            completion(false, error)
        }
    }
    
    func writeToURL(_ url: URL, completion: @escaping (Bool, Error?) -> ()) {
        guard let exportSession = AVAssetExportSession(asset: self, presetName: AVAssetExportPresetAppleM4A) else {
            completion(false, nil)
            return
        }
        exportSession.outputFileType = .m4a
        exportSession.outputURL      = url
        
        exportSession.exportAsynchronously {
            switch exportSession.status {
            case .completed:
                completion(true, nil)
            case .unknown, .waiting, .exporting, .failed, .cancelled:
                completion(false, nil)
            default: break
            }
        }
    }
    
    func audioAsset() throws -> AVAsset {
        let composition = AVMutableComposition()
        let audioTracks = tracks(withMediaType: .audio)
        
        for track in audioTracks {
            let compositionTrack = composition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
            try compositionTrack?.insertTimeRange(track.timeRange, of: track, at: track.timeRange.start)
            compositionTrack?.preferredTransform = track.preferredTransform
        }
        return composition
    }
}

class ExtractAudioOperation:AsyncOperation {
    
    var audioFileURL:URL?
    var videoURL:URL
    var audioFrames:[Float] = []
    var finish = false
    var operationExecuting = false
    
    init(videoURL:URL) {
        self.videoURL = videoURL
    }
    
    override func main() {
        self.state = .executing
        let asset = AVURLAsset(url: videoURL, options: nil)
        let audioPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        self.audioFileURL = audioPath?.appendingPathComponent(extractedAudioFileName)
        var audioSample:[Float] = []
        let dispathGroup = DispatchGroup()
        if let outputFile = self.audioFileURL {
            dispathGroup.enter()
            
            asset.writeAudioTrackToURL(URL(fileURLWithPath: outputFile.path)) { (success, error) -> () in
                if !success {
                    //print("Error in audio extraction :\(String(describing: error?.localizedDescription))")
                    dispathGroup.leave()
                }
                else {
                    if let audioURL = self.audioFileURL {
                        EPICAIAudioContext.load(fromAudioURL: URL(fileURLWithPath: audioURL.path), completionHandler: { audioContext in
                            guard let audioContext = audioContext else {
                                dispathGroup.leave()
                                fatalError("Couldn't create the audioContext")
                            }
                            audioSample = render(EPICAIAudioContext: audioContext, targetSamples: Int(audioURL.getDuration())*(frameExtractionPerSecond)).map{$0+100}
                            dispathGroup.leave()
                        })
                    }
                    else {
                        dispathGroup.leave()
                    }
                    //print("Success in audio extraction")
                }
            }
            dispathGroup.notify(queue: .main) {
                print("Audio sample in notify :\(self.audioFrames)")
                self.audioFrames = audioSample
                self.state = .finished
            }
        }
    }
}

class ProcessImages:AsyncOperation {
    
    private var currentFrame: CGImage?
    private var imageSize = CGSize.zero
    private var timelapse:String = ""
    var closeFlag:Bool = false
    var audioDeciblePower:Float = 0.0
    
    var image:CGImage
    
    init(cgImage:CGImage, timelapse:String, auidoPower:Float) {
        self.audioDeciblePower = auidoPower
        self.timelapse = timelapse
        self.image = cgImage
    }
    
    override func main() {
        self.state = .executing
        self.videoCapture(capturedImage: self.image)
    }
    
    func videoCapture(capturedImage: CGImage) {
        currentFrame = image
        self.estimation(image)
    }
    
    func estimation(_ cgImage:CGImage) {
        imageSize = CGSize(width: cgImage.width, height: cgImage.height)
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        // Create a new request to recognize a human body pose.
        let request = VNDetectHumanBodyPoseRequest(completionHandler: bodyPoseHandler)
        
        do {
            // Perform the body pose-detection request.
            try requestHandler.perform([request])
        } catch {
            self.state = .finished
            print("Unable to perform the request: \(error).")
        }
    }
    
    func bodyPoseHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedPointsObservation] else { self.state = .finished ; return }
        
        // Process each observation to find the recognized body pose points.
        if observations.count > 0 {
            _ = observations.map { (observation) -> [CGPoint] in
                let ps = processObservation(observation)
                return ps ?? []
            }
        }
        else {
            self.state = .finished
        }
    }
    
    func processObservation(_ observation: VNRecognizedPointsObservation) -> [CGPoint]? {
        guard let recognizedPoints =
                try? observation.recognizedPoints(forGroupKey: VNRecognizedPointGroupKey.all) else { self.state = .finished ; return [] }
        
        let imagePoints: [CGPoint] = recognizedPoints.values.compactMap {
            guard $0.confidence > 0 else { self.state = .finished; return nil }
            DispatchQueue.main.async {
                EPICAIFileManager.shared().writeBodyPointsInToCSV(pointDict: recognizedPoints, height: Int(self.imageSize.height), width: Int(self.imageSize.width),closeFlasg: self.closeFlag, timeLapse: self.timelapse)
                if self.audioDeciblePower > 0 {
                    EPICAIFileManager.shared().writeAudioPointsIntoCSV(volume: Int(self.audioDeciblePower), closeFlasg: self.closeFlag, timeLapse: self.timelapse)
                }
                self.state = .finished
            }
            return VNImagePointForNormalizedPoint($0.location,
                                                  Int(imageSize.width),
                                                  Int(imageSize.height))
        }
        return imagePoints
    }
}

class WriteVideoInDocumentDirectory:AsyncOperation {
    var videoURL:URL
    var fileName:String
    var localURL:URL?
    init(videoURL:URL, fileName:String) {
        self.videoURL = videoURL
        self.fileName = fileName
    }
    
    override func main() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileURL = url?.appendingPathComponent(fileName)
        guard let fileURL = fileURL else {state = .finished ; return }
        do {
            let videoData = try Data(contentsOf: videoURL)
            FileManager.default.createFile(atPath: fileURL.path as String, contents: videoData, attributes: nil)
            state = .finished
            self.localURL = fileURL
        }
        catch {
            print("Error while save video in document directory :\(error.localizedDescription)")
            state = .finished
        }
    }
}

