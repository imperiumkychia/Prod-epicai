//
//  EPICAICaptureVideoVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 20/12/21.
//


import UIKit
import AVFoundation
import Vision
import AVKit
import MagicTimer


class EPICAICaptureVideoVC: UIViewController {
    
    var imageSize = CGSize.zero
    
    private var popOverPresentationManager: PopOverPresentationManager?
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var currentFrame: CGImage?
    private let videoCapture = EPICAIVideoCapture()
    
    let mainQueue = DispatchQueue.main
    
    func roundTimeInterval(_ x: Double) -> Double {
        /// rounding with two floating number: 0.23
        return Double(round(100 * (x) / 100))
    }
    
    var isRecording: Bool = false
    var videoDuration: Double?
    
    var bottomBar: CameraVCBottomBarView!
    var cameraButton: UIButton!
    var closeButton: UIButton!
    var recordButton: UIButton!
    var analyseButton: UIButton!
    var chooseFromGalleryButton: UIButton!
    var capturePermissionFlag:Bool = false
    var magicTimeView: MagicTimerView!
    
    //let cameraManager = CameraManager()
    private func setupAndBeginCapturingVideoFrames() {
        videoCapture.setUpAVCapture { error in
            if let error = error {
                print("Failed to setup camera with error \(error)")
                return
            }
            self.videoCapture.delegate = self
        }
    }
    
    func removeExistingFiles() {
        let _ = EPICAIFileManager.shared().removeBodyPointsCSV("EPICBodyPoints")
        let _ = EPICAIFileManager.shared().removeAudioPointsCSV("EPICAudioPoints")
    }
    
    func createNewRecordFiles() {
        EPICAIFileManager.shared().bodyPoseFileName = "EPICBodyPoints"
        EPICAIFileManager.shared().audioPointFileName = "EPICAudioPoints"
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        // Reinitilize the camera to update its output stream with the new orientation.
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(true)
        }
        if let navBar = self.navigationController?.navigationBar {
            print("Comes in navcontroller")
            navBar.isHidden = true
        }
        view.backgroundColor = Palette.V2.V2_VCBackground
        
        /// Bottom bar view
        bottomBar = CameraVCBottomBarView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 60.0))
        recordButton = bottomBar.centerButton
        recordButton.addTarget(self, action: #selector(toggleMovieRecording(_:)), for: .touchUpInside)
        recordButton.setImage(#imageLiteral(resourceName: "startRecordingDisabled"), for: UIControl.State.disabled)
        analyseButton = bottomBar.rightButton
        analyseButton.addTarget(self, action: #selector(changeCamera(_:)), for: .touchUpInside)
        analyseButton.isEnabled = true
        chooseFromGalleryButton = bottomBar.leftButton
        chooseFromGalleryButton.isEnabled = true
        chooseFromGalleryButton.isHidden = false
        chooseFromGalleryButton.addTarget(self, action: #selector(chooseFromGalleryButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(bottomBar)
        bottomBar.snp.makeConstraints { (make) in
            make.width.equalTo(bottomBar.frame.width)
            make.height.equalTo(bottomBar.frame.height)
            make.centerX.equalTo(view)
            make.bottom.equalTo(-100)
        }
        
        /// Stopwatch counter
        magicTimeView = MagicTimerView(frame: .zero)
        magicTimeView.translatesAutoresizingMaskIntoConstraints = false
        magicTimeView.backgroundColor = Palette.V2.V2_cameraBottomSideBackground.withAlphaComponent(0.6)
        magicTimeView.layer.cornerCurve = .continuous
        magicTimeView.cornerRadius = 20.0
        magicTimeView.textColor = Palette.V2.V2_cameraTimerLabel
        magicTimeView.font = LatoFont.regular.withSize(22.0)
        magicTimeView.delegate = self
        
        view.addSubview(magicTimeView)
        magicTimeView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(100.0)
            make.height.equalTo(magicTimeView.cornerRadius * 2.0)
            make.bottom.equalTo(bottomBar.snp.top).offset(-20.0)
        }
        
        
        /// Full/Half body switch
        let buttonCornerRadius: CGFloat = 20.0
        /// Change camera button
        //        cameraButton = UIButton(frame: .zero)
        //        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        //        cameraButton.setImage(#imageLiteral(resourceName: "revCamera"), for: UIControl.State.normal)
        //        cameraButton.setImage(#imageLiteral(resourceName: "revCamera_disabled"), for: UIControl.State.disabled)
        //        cameraButton.imageEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        //        cameraButton.backgroundColor = Palette.V2.V2_cameraVCSwitchUnselectedBackground
        //        cameraButton.addTarget(self, action: #selector(changeCamera(_:)), for: .touchUpInside)
        //        cameraButton.layer.cornerRadius = buttonCornerRadius
        //        view.addSubview(cameraButton)
        //        cameraButton.snp.makeConstraints { (make) in
        //            make.height.equalTo(buttonCornerRadius * 2.0)
        //            make.width.equalTo(buttonCornerRadius * 2.0)
        //            make.centerY.equalTo(100)
        //            make.leading.equalTo(50)
        //        }
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavBar()
        self.removeExistingFiles()
        self.createNewRecordFiles()
        self.isRecording = false
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestPermission()
        self.setupAndBeginCapturingVideoFrames()
    }
    
    func requestPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.capturePermissionFlag = granted
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            capturePermissionFlag = true
        @unknown default:
            return
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavBar()
        videoCapture.stopCapturing()
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        if let tb = tabBarController as? GenericTabBarController {
            tb.floatingTabbarView.changeTab(toIndex: 0)
        }
    }
    
    // MARK: - Import from Library
    @objc func chooseFromGalleryButtonTapped(_ sender: Any) {
        let videoPicker = UIImagePickerController()
        videoPicker.delegate = self
        videoPicker.sourceType = .photoLibrary
        videoPicker.mediaTypes = ["public.movie"]
        videoPicker.allowsEditing = false
        self.present(videoPicker, animated: true, completion: nil)
    }
    
    // MARK: - Convert video
    func analyseButtonTapped() {
        print("moveToAnalyseView: url")
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
        //            //guard let url = self.videoCapture.videoURL else { return }
        //            //            let player = AVPlayer(url: url)
        //            //            let playerController = AVPlayerViewController()
        //            //
        //            //            playerController.player = player
        //            //            self.addChild(playerController)
        //            //            self.view.addSubview(playerController.view)
        //            //            playerController.view.frame = self.view.frame
        //            //            player.play()
        //
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("TestVideo.mp4")
        
        print("moveToAnalyseView: url \(url)")
        
        let player = AVPlayer(url: URL.init(fileURLWithPath: url.path))  // video path coming from above function
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        //        }
        
        
        
    }
    
    private func deviceOrientation() -> UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    func moveToPostView() {
        let controller = EPICAIComposePost.instantiateFromAppStoryBoard(appStoryBoard: .VPStoryboard)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    // MARK: - ChangeCamera
    @objc private func changeCamera(_ cameraButton: UIButton) {
#if targetEnvironment(simulator)
        self.moveToPostView()
        return
#else
        print("changeCamera")
        videoCapture.flipCamera { error in
            if let error = error {
                print("Failed to flip camera with error \(error)")
            }
        }
#endif
    }
    
    func getDurationForVideo(at url: URL) -> Double? {
        let asset = AVURLAsset(url: url)
        guard let _ = asset.tracks(withMediaType: .video).first else { return nil }
        return Double(round(10 * (asset.duration.seconds) / 10))
    }
    
    @objc private func toggleMovieRecording(_ recordButton: UIButton) {
        if self.isRecording {
            self.stopCapturing()
        } else {
            self.isRecording = true
            self.recordButton.setImage(#imageLiteral(resourceName: "startRecord"), for: .normal)
            let videoURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("TestVideo.mp4")
            EPICAIFileManager.removeVideoFile(atURL: videoURL) { status in
                //self.videoCapture.startCapturing()
                self.videoCapture.prepareCapturing()
                self.videoCapture.videoCuptureSessionStarted = { state in
                    if state {
                        self.magicTimeView.startCounting()
                    }
                }
            }
        }
    }
    
    func stopCapturing() {
        self.magicTimeView.reset()
        self.isRecording = false
        self.videoCapture.stopCapturing()
        self.recordButton.setImage(#imageLiteral(resourceName: "stopRecord"), for: .normal)
        self.videoCapture.videoCuptureDone = { url in
            DispatchQueue.main.async {
                self.moveToVideoTrimimg(videoURL: url)
            }
        }
    }
    
    func moveToVideoTrimimg(videoURL:URL) {
        if let navController = self.navigationController {
            let controller = EPICAIVideoTrimVC()
            print("Video URL: \(videoURL)")
            controller.videoURL = videoURL
            navController.pushViewController(controller, animated: true)
        }
    }
}

extension EPICAICaptureVideoVC: MagicTimerViewDelegate {
    func timerElapsedTimeDidChange(timer: MagicTimerView, elapsedTime: TimeInterval) {
        if elapsedTime >= Double(maximumVideoLength) * 60.0 {
            self.mainQueue.async {
                self.magicTimeView.reset()
                self.videoCapture.stopCapturing()
            }
        }
    }
}

extension EPICAICaptureVideoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - VideoCaptureDelegate

extension EPICAICaptureVideoVC: VideoCaptureDelegate {
    
    func videoCapture(_ videoCapture: EPICAIVideoCapture, didCaptureFrame capturedImage: CGImage?) {
        guard let image = capturedImage else {
            fatalError("Captured image is null")
        }
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
            print("Unable to perform the request: \(error).")
        }
    }
    
    func bodyPoseHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedPointsObservation] else { return }
        
        // Process each observation to find the recognized body pose points.
        if observations.count == 0 {
            guard let currentFrame = self.currentFrame else {
                return
            }
            let image = UIImage(cgImage: currentFrame)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        } else {
            let points = observations.map { (observation) -> [CGPoint] in
                let ps = processObservation(observation)
                return ps ?? []
            }
            
            let flatten = points.flatMap{$0}
            
            let image = currentFrame?.drawPoints(points: flatten)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    func processObservation(_ observation: VNRecognizedPointsObservation) -> [CGPoint]? {
        guard let recognizedPoints =
                try? observation.recognizedPoints(forGroupKey: VNRecognizedPointGroupKey.all) else { return [] }
        
        let imagePoints: [CGPoint] = recognizedPoints.values.compactMap {
            guard $0.confidence > 0 else { return nil }
            EPICAIFileManager.shared().writeBodyPointsInToCSV(pointDict: recognizedPoints, height: Int(imageSize.height), width: Int(imageSize.width),closeFlasg: self.videoCapture.captureState == .end)
            return VNImagePointForNormalizedPoint($0.location,
                                                  Int(imageSize.width),
                                                  Int(imageSize.height))
        }
        return imagePoints
    }
}




