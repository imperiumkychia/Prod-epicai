//
//  EPICAIVideoCapture.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import AVFoundation
import CoreVideo
import UIKit
import VideoToolbox
import SQLite

enum CaptureState {
    case idle, start, capturing, end, pause
}

protocol VideoCaptureDelegate: AnyObject {
    func videoCapture(_ videoCapture: EPICAIVideoCapture, didCaptureFrame image: CGImage?)
}

/// - Tag: VideoCapture
class EPICAIVideoCapture: NSObject {
    enum VideoCaptureError: Error {
        case captureSessionIsMissing
        case invalidInput
        case invalidOutput
        case unknown
    }
    /// The delegate to receive the captured frames.
    weak var delegate: VideoCaptureDelegate?
    
    /// A capture session used to coordinate the flow of data from input devices to capture outputs.
    var captureSession = AVCaptureSession()
    
    /// A capture output that records video and provides access to video frames. Captured frames are passed to the
    /// delegate via the `captureOutput()` method.
    private var _videoDevice: AVCaptureDevice?
    var videoOutput = AVCaptureVideoDataOutput()
    var audioOutput = AVCaptureAudioDataOutput()
    
    private var _audioConnection: AVCaptureConnection?
    private var _videoConnection: AVCaptureConnection?
    
    private var _videoCompressionSettings: [String : AnyObject] = [:]
    private var _audioCompressionSettings: [String : AnyObject] = [:]
    
    /// The current camera's position.
    private(set) var cameraPostion = AVCaptureDevice.Position.back
    
    /// The dispatch queue responsible for processing camera set up and frame capture.
    private let sessionQueue = DispatchQueue(
        label: "io.al03.pose-estimation-session-queue")
    
    //RWManager
    var videoFileName  = UUID().uuidString
    var captureState:CaptureState  = .idle
    private var assetWriter: AVAssetWriter?
    private var videoWriterInput: AVAssetWriterInput?
    private var audioWriterInput: AVAssetWriterInput?
    private var adpater: AVAssetWriterInputPixelBufferAdaptor?
    private var timestamp: Double = 0
    var hasWrittenFirstVideoFrame = false
    var videoURL:URL?
    var videoCuptureDone:((URL) -> Void)?
    var videoCuptureSessionStarted:((Bool) -> Void)?
    var updateCountDown:((Int) -> Void)?
    var timer:Timer?
    var countDown = EPICAISharedPreference.advanceSetting?.poseTimerTime ?? 5
    var timeLapse: String = ""
    var CAPTURE_FRAMES_PER_SECOND = 30
    override init() {
        super.init()
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                device.unlockForConfiguration()
            } catch {
                self.timer?.invalidate()
                //self.startCapturing()
            }
        } else {
            self.timer?.invalidate()
            //self.startCapturing()
        }
    }
    /// Toggles between the front and back camera.
    public func flipCamera(completion: @escaping (Error?) -> Void) {
        // sessionQueue.async {
        do {
            self.cameraPostion = self.cameraPostion == .back ? .front : .back
            // Indicate the start of a set of configuration changes to the capture session.
            self.captureSession.beginConfiguration()
            
            try self.setCaptureSessionInput()
            try self.setCaptureSessionOutput()
            
            // Commit configuration changes.
            self.captureSession.commitConfiguration()
            
            DispatchQueue.main.async {
                completion(nil)
            }
        } catch {
            DispatchQueue.main.async {
                completion(error)
            }
        }
        //}
    }
    
    func updateConfiguaration() {
        do {
            self.captureSession.beginConfiguration()
            
            try self.setCaptureSessionInput()
            try self.setCaptureSessionOutput()
            
            // Commit configuration changes.
            self.captureSession.commitConfiguration()
            
        } catch {
        }
    }
    /// Asynchronously sets up the capture session.
    ///
    /// - parameters:
    ///     - completion: Handler called once the camera is set up (or fails).
    public func setUpAVCapture(completion: @escaping (Error?) -> Void) {
        sessionQueue.async {
            do {
                try self.setUpAVCapture()
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }
    
    private func setUpAVCapture() throws {
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .hd1280x720
        try setCaptureSessionInput()
        try setCaptureSessionOutput()
        captureSession.commitConfiguration()
        self.captureSession.startRunning()
    }
    
    private func setCaptureSessionInput() throws {
        // Use the default capture device to obtain access to the physical device
        // and associated properties.
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video,position: cameraPostion)
        else {  throw VideoCaptureError.invalidInput }
        
        captureDevice.activeVideoMaxFrameDuration = CMTimeMake(value: 1, timescale: Int32(CAPTURE_FRAMES_PER_SECOND))
        // Remove any existing inputs.
        captureSession.inputs.forEach { input in
            captureSession.removeInput(input)
        }
        self._videoDevice = captureDevice
        
        guard let audioCaptureDevice = AVCaptureDevice.default(for: AVMediaType.audio) else {  throw VideoCaptureError.invalidInput }
        // Create an instance of AVCaptureDeviceInput to capture the data from
        // the capture device.
        guard let videoInput = try? AVCaptureDeviceInput(device: captureDevice) else { throw VideoCaptureError.invalidInput }
        
        guard let audioInput = try? AVCaptureDeviceInput(device: audioCaptureDevice) else { throw VideoCaptureError.invalidInput }
        
        //Add Audio Input
        guard captureSession.canAddInput(audioInput) else {
            throw VideoCaptureError.invalidInput
        }
        
        guard captureSession.canAddInput(videoInput) else {
            throw VideoCaptureError.invalidInput
        }
        self.captureSession.addInput(audioInput)
        self.captureSession.addInput(videoInput)
    }
    
    private func setCaptureSessionOutput() throws {
        // Remove any previous outputs.
        captureSession.outputs.forEach { output in
            captureSession.removeOutput(output)
        }
        
        let audioCaptureQueue = DispatchQueue(label: "com.apple.sample.capturepipeline.audio", attributes: [])
        audioOutput.setSampleBufferDelegate(self, queue: audioCaptureQueue)
        
        guard captureSession.canAddOutput(audioOutput) else {
            throw VideoCaptureError.invalidOutput
        }
        
        captureSession.addOutput(audioOutput)
        _audioConnection = audioOutput.connection(with: AVMediaType.audio)
        
        // Set the pixel type.
        let settings: [String: Any] = [
            String(kCVPixelBufferPixelFormatTypeKey): kCVPixelFormatType_420YpCbCr8BiPlanarFullRange
        ]
        videoOutput.videoSettings = settings
        // Discard newer frames that arrive while the dispatch queue is already busy with
        // an older frame.
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        
        guard captureSession.canAddOutput(videoOutput) else {
            throw VideoCaptureError.invalidOutput
        }
        captureSession.addOutput(videoOutput)
        
        _videoConnection = videoOutput.connection(with: AVMediaType.video)
        
        // Update the video orientation
        if let connection = videoOutput.connection(with: .video),
           connection.isVideoOrientationSupported {
            connection.videoOrientation =
            AVCaptureVideoOrientation(deviceOrientation: UIDevice.current.orientation)
            connection.isVideoMirrored = cameraPostion == .front
            
            // Inverse the landscape orientation to force the image in the upward
            // orientation.
            if connection.videoOrientation == .landscapeLeft {
                connection.videoOrientation = .landscapeRight
            } else if connection.videoOrientation == .landscapeRight {
                connection.videoOrientation = .landscapeLeft
            }
        }
        _audioCompressionSettings = audioOutput.recommendedAudioSettingsForAssetWriter(writingTo: AVFileType.mov)! as [String: AnyObject]
        _videoCompressionSettings = videoOutput.recommendedVideoSettingsForAssetWriter(writingTo: AVFileType.mov)! as [String: AnyObject]
        print(_videoCompressionSettings) // Change AverageBitRate to increase/decrease quality, also fixing to 720p instead of 1080p will aid reducing.
    }
    
    func tourchOnOff(finalShot:Bool) {
        if let state = EPICAISharedPreference.advanceSetting?.tourchState , state {
            self.toggleTorch(on: true)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.toggleTorch(on: false)
        }
        if (finalShot) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                if let state = EPICAISharedPreference.advanceSetting?.tourchState , state {
                    self.toggleTorch(on: true)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.toggleTorch(on: false)
                self.timer?.invalidate()
                self.startCapturing()
            }
        }
    }
    
    public func stopTimer() {
        self.countDown = EPICAISharedPreference.advanceSetting?.poseTimerTime ?? 5
        self.toggleTorch(on: false)
        timer?.invalidate()
    }
    
    public func prepareCapturing() {
        self.updateConfiguaration()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(manageTorchOnOff), userInfo: nil, repeats: true)
    }
    
    @objc func manageTorchOnOff() {
        if let countDown = self.updateCountDown {
            countDown(self.countDown)
        }
        self.countDown = self.countDown - 1
        if (self.countDown == 0){
            self.tourchOnOff(finalShot: true)
            timer?.invalidate()
            self.updateCountDown = nil
            return
        }
        self.tourchOnOff(finalShot: false)
    }
    
    /// Begin capturing frames.
    ///
    /// - Note: This is performed off the main thread as starting a capture session can be time-consuming.
    ///
    /// - parameters:
    ///     - completionHandler: Handler called once the session has started running.
    public func startCapturing() {
        if !self.captureSession.isRunning {
            self.captureSession.startRunning()
        }
        self.captureState = .start
        if let startSession = self.videoCuptureSessionStarted {
            startSession(true)
        }
    }
    
    public func udpateTimerValue(timeLapse:String) {
        self.timeLapse = timeLapse
        //print("Time interval \(self.timeLapse)")
    }
    /// End capturing frames
    ///
    /// - Note: This is performed off the main thread, as stopping a capture session can be time-consuming.
    ///
    /// - parameters:
    ///     - completionHandler: Handler called once the session has stopping running.
    public func stopCapturing() {
        if self.captureSession.isRunning {
            self.captureState = .end
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.captureSession.stopRunning()
                self.reset()
            }
        }
    }
    
    public func reset() {
        self.captureSession = AVCaptureSession()
        self._audioConnection = nil
        self._videoConnection = nil
        self._videoDevice  = nil
        self.videoOutput = AVCaptureVideoDataOutput()
        self.audioOutput = AVCaptureAudioDataOutput()
        self.adpater = nil
        self.assetWriter = nil
        self.videoWriterInput = nil
        self.audioWriterInput = nil
        self.hasWrittenFirstVideoFrame = false
        // self.videoFileName = UUID().uuidString
    }
}

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate

extension EPICAIVideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate {
    
    public func captureOutput(_ output: AVCaptureOutput,
                              didOutput sampleBuffer: CMSampleBuffer,
                              from connection: AVCaptureConnection) {
        let timestamp = CMSampleBufferGetPresentationTimeStamp(sampleBuffer).seconds
        
        
        switch(self.captureState) {
        case .start:
            self.videoURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("\(videoFileName).mp4")
            let writer = try! AVAssetWriter(outputURL: self.videoURL!, fileType: .mp4)
            
            let videoSettings = self.videoOutput.recommendedVideoSettingsForAssetWriter(writingTo: .mp4)
            let videoInput = AVAssetWriterInput(mediaType: .video, outputSettings: videoSettings)
            videoInput.mediaTimeScale = CMTimeScale(bitPattern: 600)
            videoInput.expectsMediaDataInRealTime = true
            
            let pixelBufferAttributes = [
                kCVPixelBufferCGImageCompatibilityKey: NSNumber(value: true),
                kCVPixelBufferCGBitmapContextCompatibilityKey: NSNumber(value: true),
                kCVPixelBufferPixelFormatTypeKey: NSNumber(value: Int32(kCVPixelFormatType_32ARGB))
            ] as [String:Any]
            
            let adapter = AVAssetWriterInputPixelBufferAdaptor(assetWriterInput: videoInput, sourcePixelBufferAttributes: pixelBufferAttributes)
            if writer.canAdd(videoInput) { writer.add(videoInput) }
            
            let audioSettings = self.audioOutput.recommendedAudioSettingsForAssetWriter(writingTo: .mp4)
            let audioInput = AVAssetWriterInput(mediaType: .audio, outputSettings: audioSettings)
            audioInput.expectsMediaDataInRealTime = true
            if writer.canAdd(audioInput) { writer.add(audioInput) }
            
            //writer.startWriting()
            //writer.startSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sampleBuffer))
            
            //writer.startSession(atSourceTime: CMTime(seconds: timestamp, preferredTimescale: CMTimeScale(600)))
            //self.v = videoPath!.absoluteString
            assetWriter = writer
            videoWriterInput = videoInput
            audioWriterInput = audioInput
            adpater = adapter
            self.timestamp = timestamp
            self.captureState = .capturing
            
        case .capturing:
            if output == self.videoOutput {
                if !hasWrittenFirstVideoFrame {
                    hasWrittenFirstVideoFrame = true
                    self.assetWriter?.startWriting()
                    assetWriter?.startSession(atSourceTime: CMSampleBufferGetPresentationTimeStamp(sampleBuffer))
                }
                if videoWriterInput?.isReadyForMoreMediaData == true {
                    let time = CMTime(seconds: timestamp, preferredTimescale: CMTimeScale(600))
                    adpater?.append(CMSampleBufferGetImageBuffer(sampleBuffer)!, withPresentationTime: time)
                }
            } else if output == self.audioOutput {
                if audioWriterInput?.isReadyForMoreMediaData == true && hasWrittenFirstVideoFrame {
                    audioWriterInput?.append(sampleBuffer)
                }
            }
            break
            
        case .end:
            guard videoWriterInput?.isReadyForMoreMediaData == true, assetWriter?.status != .failed else { break }
            videoWriterInput?.markAsFinished()
            audioWriterInput?.markAsFinished()
            assetWriter?.finishWriting { [weak self] in
                guard let outputURL = self?.assetWriter?.outputURL else { return }
                self?.videoURL = outputURL
                self?.captureState = .idle
                self?.assetWriter = nil
                self?.videoWriterInput = nil
                self?.audioWriterInput = nil
                if let captureDone = self?.videoCuptureDone {
                    captureDone(outputURL)
                }
            }
            
        default : break
            
        }
        
        guard let delegate = delegate else { return }
        
        if let pixelBuffer = sampleBuffer.imageBuffer {
            // Attempt to lock the image buffer to gain access to its memory.
            guard CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly) == kCVReturnSuccess
            else {
                return
            }
            var image: CGImage?
            VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &image)
            CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly)
            DispatchQueue.main.sync {
                delegate.videoCapture(self, didCaptureFrame: image)
            }
        }
        
        var buffer: CMBlockBuffer? = nil
        // Needs to be initialized somehow, even if we take only the address
        let convenianceBuffer = AudioBuffer(mNumberChannels: 1, mDataByteSize: 0, mData: nil)
        var audioBufferList = AudioBufferList(mNumberBuffers: 1,
                                              mBuffers: convenianceBuffer)
        
        CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(
            sampleBuffer,
            bufferListSizeNeededOut: nil,
            bufferListOut: &audioBufferList,
            bufferListSize: MemoryLayout<AudioBufferList>.size(ofValue: audioBufferList),
            blockBufferAllocator: nil,
            blockBufferMemoryAllocator: nil,
            flags: UInt32(kCMSampleBufferFlag_AudioBufferList_Assure16ByteAlignment),
            blockBufferOut: &buffer
        )
        let abl = UnsafeMutableAudioBufferListPointer(&audioBufferList)
        var decibels:Float = 0.0
        for buffer in abl {
            let originRawPtr = buffer.mData
            let ptrDataSize = Int(buffer.mDataByteSize)
            // From raw pointer to typed Int16 pointer
            let buffPtrInt16 = originRawPtr?.bindMemory(to: Int16.self, capacity: ptrDataSize)
            // From pointer typed Int16 to pointer of [Int16]
            // So we can iterate on it simply
            let unsafePtrByteSize = ptrDataSize/Int16.bitWidth
            let samples = UnsafeMutableBufferPointer<Int16>(start: buffPtrInt16,
                                                            count: unsafePtrByteSize)
            // Average of each sample squared, then root squared
            let sumOfSquaredSamples = samples.map(Float.init).reduce(0) { $0 + $1*$1 }
            //let averageOfSomething = sqrt(sumOfSquaredSamples / Float(samples.count))
            let power = sumOfSquaredSamples / Float(samples.count)
            decibels = 10*log10f(power);
        }
        
        DispatchQueue.main.async {
            if decibels.isFinite && decibels > 0 {
                //print("Decible power : \(String(decibels))")
                if self.timeLapse != "" {
                    EPICAIFileManager.shared().writeAudioPointsIntoCSV(volume: Int(decibels),closeFlasg: self.captureState == .end, timeLapse: self.timeLapse, timeCheck: true)
                }
            }
        }
    }
}

