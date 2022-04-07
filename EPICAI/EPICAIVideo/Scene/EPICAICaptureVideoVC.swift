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
import CDAlertView

class EPICAICaptureVideoVC: UIViewController {
    
    var imageSize = CGSize.zero
    
    private var popOverPresentationManager: PopOverPresentationManager?
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var currentFrame: CGImage?
    private var videoCapture = EPICAIVideoCapture()
    
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
    var timeValueLabel:UILabel!
    var bottomBarPadding = 100
    
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var timeStampString = ""
    
    var previewView : UIView!
    private var previewLayer: AVCaptureVideoPreviewLayer?
    let videoEntitleMentVM = EPICAIEntitlementVM()
    
    private func setupAndBeginCapturingVideoFrames() {
        self.videoCapture = EPICAIVideoCapture()
        videoCapture.setUpAVCapture { error in
            if let error = error {
                print("Failed to setup camera with error \(error)")
                return
            }
            self.removeExistingFiles(fileName: self.videoCapture.videoFileName)
            //self.createNewRecordFiles(fileName: self.videoCapture.videoFileName)
            self.videoCapture.delegate = self
            DispatchQueue.main.async {
                self.previewLayer = AVCaptureVideoPreviewLayer.init(session: self.videoCapture.captureSession)
                self.previewLayer?.videoGravity = .resizeAspectFill
                let rootLayer :CALayer = self.previewView.layer
                rootLayer.masksToBounds=true
                self.previewLayer?.frame = rootLayer.bounds
                if let previewLayer = self.previewLayer {
                    rootLayer.addSublayer(previewLayer)
                }
            }
        }
    }
    
    func resetTimerTime() {
        if !self.videoCapture.captureSession.isRunning {
            if let timeInSecond = EPICAISharedPreference.advanceSetting?.poseTimerTime {
                self.timeValueLabel.text = (timeInSecond > 5) ? "10.00" : "0\(timeInSecond):00"
            }
            else {
                self.timeValueLabel.text = "05.00"
            }
        }
        else {
            if let timeInSecond = EPICAISharedPreference.advanceSetting?.poseTimerTime {
                self.timeValueLabel.text = (timeInSecond > 5) ? "10.00" : "0\(timeInSecond):00"
            }
            else {
                self.timeValueLabel.text = "05.00"
            }
        }
        self.timer?.invalidate()
        timer = nil
        self.startTime = 0
        self.time = 0
    }
    
    func manageUIState(state:Bool) {
        if state {
            self.closeButton.isEnabled = true
            self.recordButton.isEnabled = true
        }
        else {
            self.closeButton.isEnabled = false
            self.recordButton.isEnabled = false
        }
    }
    
    func removeExistingFiles(fileName:String) {
        let _ = EPICAIFileManager.shared().removeBodyPointsCSV(fileName)
        let _ = EPICAIFileManager.shared().removeAudioPointsCSV(fileName)
    }
    
    func createNewRecordFiles(fileName:String) {
        EPICAIFileManager.shared().bodyPoseFileName = fileName
        EPICAIFileManager.shared().audioPointFileName = fileName
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      updatePreview()
    }

    func updatePreview() {
      let orientation: AVCaptureVideoOrientation
      switch UIDevice.current.orientation {
        case .portrait:
          orientation = .portrait
          self.bottomBar.snp.updateConstraints { make in
              make.bottom.equalTo(-100)
          }
        case .landscapeRight:
          orientation = .landscapeLeft
          self.bottomBar.snp.updateConstraints { make in
              make.bottom.equalTo(-50)
          }
        case .landscapeLeft:
          orientation = .landscapeRight
          self.bottomBar.snp.updateConstraints { make in
              make.bottom.equalTo(-50)
          }
        case .portraitUpsideDown:
          orientation = .portraitUpsideDown
          self.bottomBar.snp.updateConstraints { make in
              make.bottom.equalTo(-100)
          }
        default:
          orientation = .portrait
          self.bottomBar.snp.updateConstraints { make in
              make.bottom.equalTo(-100)
          }
      }
      self.previewView.frame.size.width = self.view.frame.size.width
      self.previewView.frame.size.height = self.view.frame.size.height

      if previewLayer?.connection?.isVideoOrientationSupported == true {
          previewLayer?.connection?.videoOrientation = orientation
      }
      let rootLayer :CALayer = self.previewView.layer
      rootLayer.masksToBounds=true
      self.previewLayer?.frame = rootLayer.bounds
    }
    
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
    }
    
    func showAVideoRecordLimitAlert() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Your, Recording limit get exausted, revise your plan or contact to admin", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Ok", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            //self.dismiss(animated: true, completion: nil)
            self.moveToFeedPage()
            return true
        }
        alert.circleFillColor = Palette.darkPurple
        doneAction.buttonTextColor = Palette.darkPurple
        alert.add(action: doneAction)
        alert.show()
    }
    
    func videoEntitlementCheck() {
        self.videoEntitleMentVM.getVideoEntitlementDetails()
        self.videoEntitleMentVM.notifyVideoEntitlement = { details in
            if details.remainingSeconds <= 0  {
                self.showAVideoRecordLimitAlert()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewView = UIView(frame: CGRect(x: 0,
                                           y: 0,
                                           width: UIScreen.main.bounds.size.width,
                                           height: UIScreen.main.bounds.size.height))
        previewView.contentMode = UIView.ContentMode.scaleToFill
        view.addSubview(previewView)
        
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(true)
        }
        if let navBar = self.navigationController?.navigationBar {
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
        
        self.timeValueLabel = UILabel(frame: .zero)
        self.timeValueLabel.textAlignment = .center
        self.timeValueLabel.clipsToBounds = true
        self.timeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeValueLabel.backgroundColor = Palette.V2.V2_cameraBottomSideBackground.withAlphaComponent(0.6)
        self.timeValueLabel.layer.cornerCurve = .continuous
        self.timeValueLabel.layer.cornerRadius = 20
        self.timeValueLabel.textColor = Palette.V2.V2_cameraTimerLabel
        self.timeValueLabel.font = LatoFont.regular.withSize(20)
        if let timeInSecond = EPICAISharedPreference.advanceSetting?.poseTimerTime {
            self.timeValueLabel.text = (timeInSecond > 5) ? "10.00" : "0\(timeInSecond):00"
        }
        else {
            self.timeValueLabel.text = "05.00"
        }
        
        view.addSubview(self.timeValueLabel)
        timeValueLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(100.0)
            make.height.equalTo(timeValueLabel.layer.cornerRadius * 2.0)
            make.bottom.equalTo(bottomBar.snp.top).offset(-20.0)
        }
        
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isIdleTimerDisabled = true
        self.hideNavBar()
        self.isRecording = false
        self.imageView.image = nil
        self.previewLayer?.removeFromSuperlayer()
        self.previewLayer = nil
        if let timeInSecond = EPICAISharedPreference.advanceSetting?.poseTimerTime {
            self.timeValueLabel.text = (timeInSecond > 5) ? "10.00" : "0\(timeInSecond):00"
        }
        else {
            self.timeValueLabel.text = "05.00"
        }
        self.setupAndBeginCapturingVideoFrames()
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestPermission()
        self.videoEntitlementCheck()
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
        UIApplication.shared.isIdleTimerDisabled = false
        showNavBar()
        videoCapture.stopCapturing()
        self.resetTimerTime()
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        if let torchState = EPICAISharedPreference.advanceSetting?.tourchState, torchState && self.isRecording {
            self.showAlertWithOption()
        }
        else  {
            self.moveToFeedPage()
        }
    }
    
    private func moveToFeedPage() {
        self.stopCapturing(moveToNextVC:false)
        self.navigationController?.popToRootViewController(animated: true)
        if let videoURL = self.videoCapture.videoURL {
            EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: videoURL)
        }
        if let tabCont = self.tabBarController as? GenericTabBarController {
            tabCont.floatingTabbarView.changeTab(toIndex: 0)
        }
    }
    
    func showAlertWithOption() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Are you confirm to stop the recording? Press yes, to exit the recording", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Yes", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            //self.dismiss(animated: true, completion: nil)
            self.moveToFeedPage()
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
    
    func showAlertWhenChoseFromGallary() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Are you confirm to stop the recording? Press yes, to exit the recording", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Yes", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            //self.dismiss(animated: true, completion: nil)
            self.stopCapturing(moveToNextVC: false)
            if let videoURL = self.videoCapture.videoURL {
                EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: videoURL)
            }
            self.openVideoGallary()
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
    
    // MARK: - Import from Library
    
    private func openVideoGallary() {
        let videoPicker = UIImagePickerController()
        videoPicker.delegate = self
        videoPicker.sourceType = .photoLibrary
        videoPicker.mediaTypes = ["public.movie"]
        videoPicker.allowsEditing = false
        self.present(videoPicker, animated: true, completion: nil)
    }
    
    @objc func chooseFromGalleryButtonTapped(_ sender: Any) {
        if self.isRecording {
            self.showAlertWhenChoseFromGallary()
        }
        else {
            self.openVideoGallary()
        }
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
        if self.videoCapture.captureSession.isRunning {
            videoCapture.flipCamera { error in
                if let error = error {
                    print("Failed to flip camera with error \(error)")
                }
                else {
                    if self.videoCapture.cameraPostion == .front {
                        self.analyseButton.tintColor = Palette.darkPurple
                    }
                    else {
                        self.analyseButton.tintColor = .white
                    }
                }
            }
        }
    }
    
    @objc private func toggleMovieRecording(_ recordButton: UIButton) {
        if self.isRecording {
            if let  video = self.videoCapture.videoURL, video.getResourceSizeInInt() > 20 {
                self.stopCapturing(moveToNextVC: true)
            }
            else {
                return
            }
        } else {
            self.isRecording = true
            //self.videoCapture.startCapturing()
           
            
            self.videoCapture.updateCountDown = { value in
                self.timeValueLabel.text = String(format: "%d:00", value)
            }
            
            self.videoCapture.videoCuptureSessionStarted = { state in
                if state {
                    self.createNewRecordFiles(fileName: self.videoCapture.videoFileName)
                    self.resetTimerTime()
                    self.startTime = Date().timeIntervalSinceReferenceDate
                    
                    self.recordButton.setImage(#imageLiteral(resourceName: "stopRecord"), for: .normal)
                    self.timer = Timer.scheduledTimer(timeInterval: 0.05,
                                                 target: self,
                                                      selector: #selector(self.advanceTimer(timer:)),
                                                 userInfo: nil,
                                                 repeats: true)
                }
            }
            self.videoCapture.prepareCapturing()
        }
    }
    
    @objc func advanceTimer(timer: Timer) {
        time = Date().timeIntervalSinceReferenceDate - startTime
        self.timeStampString = time.stringFromTimeInterval()
        timeValueLabel.text = self.timeStampString
        self.videoCapture.udpateTimerValue(timeLapse:self.timeStampString)
        if time >= Double(maximumVideoLength) * 60.0 {
            self.mainQueue.async {
                self.resetTimerTime()
                self.stopCapturing(moveToNextVC: true)
            }
        }
    }
    
    func stopCapturing(moveToNextVC:Bool) {
        self.videoCapture.stopTimer()
        self.videoCapture.stopCapturing()
        self.resetTimerTime()
        self.recordButton.setImage(#imageLiteral(resourceName: "startRecord"), for: .normal)
        self.isRecording = false
        self.videoCapture.videoCuptureDone = { url in
            DispatchQueue.main.async {
                if moveToNextVC { self.moveToVideoTrimimg(videoURL: url) }
            }
        }
    }
    
    func moveToVideoTrimimg(videoURL:URL) {
        if let navController = self.navigationController {
            let controller = EPICAIVideoTrimVC()
            controller.videoURL = videoURL
            navController.pushViewController(controller, animated: true)
        }
    }
}

extension EPICAICaptureVideoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL else { return }
        
        if  videoURL.getDuration() > 1200 {
            self.showLargeVideoFromGallaryAlert(picker)
        }
        else {
            let videoExaminationVC = EPICAIVideoExaminationVC.instantiateFromAppStoryBoard(appStoryBoard: .VPStoryboard)
            videoExaminationVC.videoURL = info[UIImagePickerController.InfoKey.mediaURL] as? URL
            self.navigationController?.pushViewController(videoExaminationVC, animated: true)
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func showLargeVideoFromGallaryAlert(_ picker: UIImagePickerController) {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Video is too long to process. Please select video which have duration lower then 20 minutes", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Ok", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            picker.dismiss(animated: true, completion: nil)
            return true
        }
        alert.circleFillColor = Palette.darkPurple
        doneAction.buttonTextColor = Palette.darkPurple
        alert.add(action: doneAction)
        alert.show()
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
            DispatchQueue.main.async {
                if self.timeStampString != "" {
                    EPICAIFileManager.shared().writeBodyPointsInToCSV(pointDict: recognizedPoints, height: Int(self.imageSize.height), width: Int(self.imageSize.width),closeFlasg: self.videoCapture.captureState == .end, timeLapse: self.timeStampString, timeCheck: true)
                }
            }
            return VNImagePointForNormalizedPoint($0.location,
                                                  Int(imageSize.width),
                                                  Int(imageSize.height))
        }
        return imagePoints
    }
}




