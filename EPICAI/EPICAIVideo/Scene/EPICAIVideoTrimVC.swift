//
//  EPICAIVideoTrimVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 20/12/21.
//

import UIKit
import SnapKit
import AVFoundation
import AVKit
import CDAlertView
import Photos

protocol VideoTrimViewControllerDelegate: AnyObject {
    func videoTrim(_ viewController: EPICAIVideoTrimVC, didFinishTrimmimgWithVideoURL url: URL?)
}

class EPICAIVideoTrimVC: UIViewController {

    let itemsMargin: CGFloat = 20.0

    weak var delegate: VideoTrimViewControllerDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preview"
        label.font = LatoFont.bold.withSize(25.0)
        label.textColor = Palette.V2.V2_VCTitle
        return label
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let img = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30.0, weight: .regular))
        button.tintColor = Palette.V2.V2_VCTitle
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "reset").resized(toWidth: 30), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    var durationView: VideoDurationView!
    //var resetButton: UIButton!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var playerContainer: UIView!
    var trimStartView: VideoDurationView!
    var trimEndView: VideoDurationView!
    var trimSeparatorLabel: UILabel!
    var rangeSeeker: RangeSeekSlider!
    var analyzeButton: UIButton!
    var cancelButton: UIButton!
    
    var videoURL: URL?
    var originalDuration: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground

        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        
        durationView = VideoDurationView(frame: .zero)
        durationView.translatesAutoresizingMaskIntoConstraints = false
        durationView.backgroundColor = view.backgroundColor
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(itemsMargin)
            make.top.equalTo(view).offset(3*itemsMargin)
        }
        
        closeButton.snp.makeConstraints { (make) in
            make.width.equalTo(30.0)
            make.height.equalTo(30.0)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        print("Self Video URL \(String(describing: self.videoURL))")
        guard let url = videoURL,
           let duration = getDurationForVideo(at: url) else {
            return
        }
        
        originalDuration = duration
        durationView.totalDurationInSeconds = duration
        
        view.addSubview(durationView)
        durationView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0 * itemsMargin)
            make.leading.equalTo(titleLabel)
            make.width.equalTo(45.0)
        }
        
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.width.equalTo(30.0)
            make.height.equalTo(30.0)
            make.centerY.equalTo(durationView)
            make.trailing.equalTo(closeButton)
        }
        
        playerContainer = UIView(frame: CGRect(x: 0.0,
                                               y: 0.0,
                                               width: view.bounds.width - (itemsMargin - 20),
                                               height: view.bounds.height / 3.5))
        playerContainer.translatesAutoresizingMaskIntoConstraints = false
        playerContainer.backgroundColor = Palette.V2.V2_feedsDate
        playerContainer.clipsToBounds = true
        playerContainer.layer.cornerRadius = 30.0
        playerContainer.layer.cornerCurve = .continuous
        view.addSubview(playerContainer)
        
        playerContainer.snp.makeConstraints { (make) in
            make.top.equalTo(resetButton.snp.bottom).offset(itemsMargin)
            make.leading.equalTo(view).offset(itemsMargin)
            make.trailing.equalTo(view).offset(-itemsMargin)
            make.height.equalTo(playerContainer.bounds.height)
        }
        
        guard let url = videoURL else { return }
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerContainer.bounds
        playerContainer.layer.addSublayer(playerLayer)
        
        trimStartView = VideoDurationView(frame: .zero)
        trimStartView.translatesAutoresizingMaskIntoConstraints = false
        trimStartView.backgroundColor = view.backgroundColor
        view.addSubview(trimStartView)
        
        trimEndView = VideoDurationView(frame: .zero)
        trimEndView.translatesAutoresizingMaskIntoConstraints = false
        trimEndView.backgroundColor = view.backgroundColor
        view.addSubview(trimEndView)
        
        trimSeparatorLabel = UILabel(frame: .zero)
        trimSeparatorLabel.translatesAutoresizingMaskIntoConstraints = false
        trimSeparatorLabel.text = "-"
        trimSeparatorLabel.textColor = Palette.V2.V2_VCTitle
        trimSeparatorLabel.font = LatoFont.regular.withSize(17.0)
        view.addSubview(trimSeparatorLabel)
        
        trimSeparatorLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(playerContainer)
            make.top.equalTo(playerContainer.snp.bottom).offset(itemsMargin)
        }
        
        trimStartView.snp.makeConstraints { (make) in
            make.centerY.equalTo(trimSeparatorLabel)
            make.trailing.equalTo(trimSeparatorLabel.snp.leading)
            make.width.equalTo(50)
        }
        
        trimEndView.snp.makeConstraints { (make) in
            make.centerY.equalTo(trimSeparatorLabel)
            make.leading.equalTo(trimSeparatorLabel.snp.trailing)
            make.width.equalTo(50)
        }
        trimEndView.totalDurationInSeconds = duration
        
        rangeSeeker = RangeSeekSlider(frame: .zero)
        rangeSeeker.translatesAutoresizingMaskIntoConstraints = false
        rangeSeeker.handleColor = Palette.V2.V2_pageControlIndicatorSelected
        rangeSeeker.colorBetweenHandles = Palette.V2.V2_pageControlIndicatorSelected
        rangeSeeker.hideLabels = true
        rangeSeeker.lineHeight = 5.0
        rangeSeeker.tintColor = Palette.V2.V2_profileTableDivider
        rangeSeeker.handleDiameter = 36.0
        rangeSeeker.selectedHandleDiameterMultiplier = 1.0
        rangeSeeker.minValue = 0.0
        rangeSeeker.maxValue = CGFloat(duration)
        rangeSeeker.delegate = self
        view.addSubview(rangeSeeker)
        
        rangeSeeker.snp.makeConstraints { (make) in
            make.top.equalTo(trimSeparatorLabel.snp.bottom).offset(2 * itemsMargin)
            make.leading.equalTo(durationView)
            make.trailing.equalTo(resetButton)
        }
        
        analyzeButton = UIButton(frame: .zero)
        analyzeButton.translatesAutoresizingMaskIntoConstraints = false
        analyzeButton.addTarget(self, action: #selector(analyzeButtonTapped(_:)), for: .touchUpInside)
        analyzeButton.setTitle("ANALYZE", for: .normal)
        analyzeButton.setTitleColor(.white, for: .normal)
        analyzeButton.titleLabel?.font = LatoFont.bold.withSize(15.0)
        analyzeButton.backgroundColor = Palette.V2.V2_tabBarItemBackground
        analyzeButton.layer.cornerRadius = 28.0
        analyzeButton.layer.cornerCurve = .continuous
        view.addSubview(analyzeButton)
        
        cancelButton = UIButton(frame: .zero)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(trimButtonTapped(_:)), for: .touchUpInside)
        cancelButton.setTitle("CROP", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.titleLabel?.font = LatoFont.bold.withSize(15.0)
        cancelButton.backgroundColor = Palette.V2.V2_tabBarItemBackground
        cancelButton.layer.cornerRadius = 28.0
        cancelButton.layer.cornerCurve = .continuous
        view.addSubview(cancelButton)
        
        analyzeButton.snp.makeConstraints { (make) in
            make.height.equalTo(analyzeButton.layer.cornerRadius * 2.0)
            make.width.equalTo(view.bounds.width * 0.4)
            make.trailing.equalTo(view.snp.centerX).offset(-10.0)
            make.bottom.equalTo(view).offset(-2 * itemsMargin)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.height.equalTo(analyzeButton)
            make.width.equalTo(analyzeButton)
            make.centerY.equalTo(analyzeButton)
            make.leading.equalTo(view.snp.centerX).offset(10.0)
        }
    }
    
    @objc func analyzeButtonTapped(_ sender: UIButton) {
        if let navController = self.navigationController {
           let controller = EPICAIComposePost.instantiateFromAppStoryBoard(appStoryBoard: .VPStoryboard)
            controller.videoURL = self.videoURL
            navController.pushViewController(controller, animated: true)
            if let videoURL = self.videoURL {
                self.checkPhotoLibraryPermissionToWriteVideoFor(url: videoURL)
            }
        }
    }
    
    func checkPhotoLibraryPermissionToWriteVideoFor(url:URL)  {
        switch(PHPhotoLibrary.authorizationStatus()) {
        case .authorized:
            self.writeVideoInPhotoAlbum(url: url)
        case .denied:
            print("Permission denied.")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    self.writeVideoInPhotoAlbum(url: url)
                }
            }
        case .restricted:
            print("Permission restricted to write video in photo album.")
        default: return
        }
    }
    
    private func writeVideoInPhotoAlbum(url:URL) {
        DispatchQueue.main.async {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
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
    
    @objc func trimButtonTapped(_ sender: UIButton) {
        return
        if let url = self.videoURL {
            EPICAIFileManager.cropVideo(sourceURL: url, statTime: Float(self.rangeSeeker.selectedMinValue), endTime: Float(self.rangeSeeker.selectedMaxValue)) { outPuturl, trimStatus in
            }
        }
    }
    
    func showAlertWithOption() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Are you sure, you wants to delete all files and video", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Ok", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            //self.dismiss(animated: true, completion: nil)
            EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: self.videoURL!)
            if let tabCont = self.tabBarController as? GenericTabBarController {
                tabCont.floatingTabbarView.changeTab(toIndex: 0)
            }
            self.navigationController?.popToRootViewController(animated: true)
            return true
        }
        let cancelAction = CDAlertViewAction(title: "Cancel", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            return true
        }
        
        alert.circleFillColor = Palette.darkPurple
        doneAction.buttonTextColor = Palette.darkPurple
        cancelAction.buttonTextColor = Palette.darkPurple
        
        alert.add(action: doneAction)
        alert.add(action: cancelAction)
        alert.show()
    }
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.showAlertWithOption()
    }

    @objc func resetButtonTapped(_ sender: UIButton) {
        player.seek(to: CMTime(seconds: 0.0, preferredTimescale: 1000))
        trimStartView.totalDurationInSeconds = 0.0
        trimEndView.totalDurationInSeconds = originalDuration
        rangeSeeker.selectedMinValue = rangeSeeker.minValue
        rangeSeeker.selectedMaxValue = rangeSeeker.maxValue
    }
    
    func getDurationForVideo(at url: URL) -> Double? {
        let asset = AVURLAsset(url: url)
        print("Video assest \(asset)")
        guard let _ = asset.tracks(withMediaType: .video).first else { return nil }
        return Double(round(10 * (asset.duration.seconds) / 10))
    }
    
    func seekPlayerTo(_ value: CGFloat) {
        player.seek(to: CMTime(seconds: Double(value), preferredTimescale: 1000))
    }
}

extension EPICAIVideoTrimVC: RangeSeekSliderDelegate {
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        trimStartView.totalDurationInSeconds = Double(minValue)
        trimEndView.totalDurationInSeconds = Double(maxValue)
        seekPlayerTo(minValue)
    }
}

class VideoDurationView: UIView {
    
    private var minuteLabel: UILabel!
    private var secondLabel: UILabel!
    
    var totalDurationInSeconds: Double = 0.0 {
        didSet {
            minuteLabel.text = stringFor(value: minuteFor(duration: totalDurationInSeconds))
            secondLabel.text = stringFor(value: secondFor(duration: totalDurationInSeconds))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        minuteLabel = UILabel(frame: .zero)
        minuteLabel.translatesAutoresizingMaskIntoConstraints = false
        minuteLabel.font = LatoFont.regular.withSize(17.0)
        minuteLabel.textColor = Palette.V2.V2_VCTitle
        minuteLabel.text = "00"
        minuteLabel.textAlignment = .right
        addSubview(minuteLabel)
        
        let indicator = UILabel(frame: .zero)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.font = LatoFont.regular.withSize(17.0)
        indicator.textColor = Palette.V2.V2_VCTitle
        indicator.text = ":"
        indicator.textAlignment = .center
        addSubview(indicator)
        
        secondLabel = UILabel(frame: .zero)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.font = LatoFont.regular.withSize(17.0)
        secondLabel.textColor = Palette.V2.V2_VCTitle
        secondLabel.text = "00"
        secondLabel.textAlignment = .left
        addSubview(secondLabel)
        
        indicator.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        minuteLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.trailing.equalTo(indicator.snp.leading)
        }
        
        secondLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.leading.equalTo(indicator.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func minuteFor(duration: Double) -> Int {
        return Int(duration / 60)
    }
    
    private func secondFor(duration: Double) -> Int {
        return Int(duration) - (minuteFor(duration: duration) * 60)
    }
    
    private func stringFor(value: Int) -> String {
        return value < 10 ? "0\(value)" : "\(value)"
    }
}
