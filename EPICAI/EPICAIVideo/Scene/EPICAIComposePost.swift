//
//  EPICAIComposePost.swift
//  EPICAI
//
//  Created by Abdul fattah on 24/12/21.
//

import Foundation
import UIKit
import MediaPlayer
import CoreLocation
import CDAlertView
import Reachability
import SQLite
import JGProgressHUD

class EPICAIComposePost : UIViewController {
    
    @IBOutlet weak var postTV: UITableView!
    @IBOutlet weak var closeBtn:UIButton!
    @IBOutlet weak var titleLbl:UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var videoURL:URL?
    var currentLocation:CLLocation?
    var videoTitle = videoTitlePlaceHolder
    var expandingCellHeight: CGFloat = 70
    let expandingIndexRow = 1
    var cropStartTime:Float = 0.0
    var cropEndTime:Float = 0.0
    
    var videoUploadVM = EPICAICreatePostVideoVM()
    //var offileVideoManager = EPICAIOfflineVideoManager()
    
    var ai:JGProgressHUD  = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        hud.detailTextLabel.text = "Please wait..."
        return hud
    }()
    
    @IBAction func moveBack(_ sender: Any) {
        showAlertWithOption()
    }
    
//    func manageProgress() {
//        if (self.videoUploadVM.progressState) { return }
//        self.videoUploadVM.showProgress = { (progress, uploadState, error) in
//            DispatchQueue.main.async {
//                print("Progress state :\(String(describing: uploadState))")
//                switch(uploadState) {
//                case .Start: self.closeBtn.isHidden = false ;
//                case .Video: self.closeBtn.isHidden = false ;self.activityIndicator.startAnimating()
//                case .BodyPoint: self.closeBtn.isHidden = true
//                case .AudioPoint: self.closeBtn.isHidden = true
//                case .Finish: self.closeBtn.isHidden = true ; self.activityIndicator.stopAnimating()
//                default: self.closeBtn.isHidden = false ;self.activityIndicator.stopAnimating()
//                }
//            }
//        }
//    }
    
    func cancelUpload() {
        if self.videoUploadVM.progresType == .Video {
            if self.activityIndicator.isAnimating {
                EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: self.videoURL!)
                if let tabCont = self.tabBarController as? GenericTabBarController {
                    tabCont.floatingTabbarView.changeTab(toIndex: 0)
                }
                self.videoUploadVM.progressDiscard(videoURL: self.videoURL!) { state in
                    print("Video bucket delete function : \(state)")
                }
            }
        }
        else if self.videoUploadVM.progresType == .Finish ||  self.videoUploadVM.progresType  == .Start {
            EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: self.videoURL!)
            if let tabCont = self.tabBarController as? GenericTabBarController {
                tabCont.floatingTabbarView.changeTab(toIndex: 0)
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func uploadSuccess() {
        EPICAIFileManager.shared().manageDeleteVideoAndAssets(videoURL: self.videoURL!)
        DispatchQueue.main.async {
            if let tabCont = self.tabBarController as? GenericTabBarController {
                tabCont.floatingTabbarView.changeTab(toIndex: 2)
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func showAlertWithOption() {
        guard let videoURL = self.videoURL else {return}
        if EPICAIFileManager.shared().videoFileExist(videoURL.lastPathComponent) {
            let alert = CDAlertView(title: "EPICAI Alert!", message: "Are you sure, you wants to delete all files and video", type: .alarm)
            let doneAction = CDAlertViewAction(title: "Yes", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
                self.cancelUpload()
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
        else
        {
            if let tabCont = self.tabBarController as? GenericTabBarController {
                tabCont.floatingTabbarView.changeTab(toIndex: 0)
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        let locationManager:EPICAILocationManager = EPICAILocationManager.shared
        locationManager.delegate = self
        super.viewDidLoad()
        self.closeBtn.setTitle("", for: .normal)
        registerKeyboardNotifications()
        self.titleLbl.font = LatoFont.bold.withSize(25)
        self.titleLbl.textColor = Palette.V2.V2_VCTitle
        closeBtn.tintColor = Palette.V2.V2_VCTitle
        switch(traitCollection.userInterfaceStyle) {
        case .light, .unspecified: self.view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        case .dark: self.view.backgroundColor = .black
        default: break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavBar()
        if self.cropStartTime > 0.0 {
            guard let videoURL = self.videoURL else { return }
            EPICAIFileManager.shared().fileName = videoURL.lastPathComponent.replacingOccurrences(of: "."+videoURL.pathExtension, with: "")
            EPICAIFileManager.shared().cropEndTime = self.cropEndTime
            EPICAIFileManager.shared().cropStartTime = self.cropStartTime
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.showNavBar()
    }
    
    private func showProgressView() {
        DispatchQueue.main.async{
            self.ai.show(in: self.view)
        }
    }
    
    private func hideProgressView() {
        DispatchQueue.main.async{
            self.ai.dismiss(animated: true)
        }
    }
    
    func callUploadVideoDetails() {
        self.showProgressView()
        //self.manageProgress()
        self.videoUploadVM.createVideoRecordWith(videoTitle, videoURL: self.videoURL!, location: self.currentLocation) { state in
            if state {
                self.uploadSuccess()
            }
            else {
                self.showVideoUploadError()
            }
            self.hideProgressView()
        }
//        self.videoUploadVM.createVideoRecord(videoTitle: self.videoTitle, videoURL: self.videoURL!, location: self.currentLocation) { videoDetails, error  in
//            if let error = error {
//                self.hideProgressView()
//                print("Error \(error.localizedDescription)")
//            }
//            else {
//                self.hideProgressView()
//                self.uploadSuccess()
//            }
//            print("Video details \(String(describing: videoDetails))")
//        }
    }
    
    func showVideoUploadError() {
        let alert = CDAlertView(title: "EPICAI Error!", message: "Something went wrong please try after some time or check your network connection", type: .error)
        let doneAction = CDAlertViewAction(title: "Ok", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            return true
        }
        doneAction.buttonTextColor = Palette.darkPurple
        alert.add(action: doneAction)
        alert.show()
    }
    
    func showOfflineDataAlertOption() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "Oops!! you are not connected to internet", type: .warning)
        
        let cancelAction:CDAlertViewAction
        alert.circleFillColor = Palette.darkPurple
        
        if EPICAIOfflineVideoManager.shared.getDataStoreCount() > 2 {
            cancelAction = CDAlertViewAction(title: "Discard upload", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
                self.cancelUpload()
                return true
            }
        }
        else {
            cancelAction = CDAlertViewAction(title: "Save to future use", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
                let epicVideo = EPICAIVideo(videoTitle: self.videoTitle, videoURL: self.videoURL!, location: self.currentLocation)
                if let _ = EPICAIOfflineVideoManager.shared.saveVideoRecord(epicVideo: epicVideo) {
                    if let tabCont = self.tabBarController as? GenericTabBarController {
                        tabCont.floatingTabbarView.changeTab(toIndex: 0)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
                return true
            }
        }
        cancelAction.buttonTextColor = Palette.darkPurple
        alert.add(action: cancelAction)
        alert.show()
    }
    
    func showDataAlertOption() {
        let alert = CDAlertView(title: "EPICAI Alert!", message: "You are not connected to wi-fi, Allow mobile data to upload files and video", type: .warning)
        let doneAction = CDAlertViewAction(title: "Sure", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            self.callUploadVideoDetails()
            return true
        }
        
        let cancelAction:CDAlertViewAction
        alert.circleFillColor = Palette.darkPurple
        doneAction.buttonTextColor = Palette.darkPurple
        
        if EPICAIOfflineVideoManager.shared.getDataStoreCount() > 2 {
            cancelAction = CDAlertViewAction(title: "Discard upload", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
                self.cancelUpload()
                return true
            }
        }
        else {
            cancelAction = CDAlertViewAction(title: "Save to future use", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
                let epicVideo = EPICAIVideo(videoTitle: self.videoTitle, videoURL: self.videoURL!, location: self.currentLocation)
                if let _ = EPICAIOfflineVideoManager.shared.saveVideoRecord(epicVideo: epicVideo) {
                    if let tabCont = self.tabBarController as? GenericTabBarController {
                        tabCont.floatingTabbarView.changeTab(toIndex: 0)
                    }
                    self.navigationController?.popToRootViewController(animated: true)
                }
                return true
            }
        }
        cancelAction.buttonTextColor = Palette.darkPurple
        alert.add(action: doneAction)
        alert.add(action: cancelAction)
        alert.show()
    }
    
    func composePost() {
        if postValidation() {
            do {
                let hostName = "google.com"
                let reachability = try Reachability(hostname: hostName)
                if reachability.connection == .wifi {
                    self.callUploadVideoDetails()
                }
                else if reachability.connection == .cellular {
                    self.showDataAlertOption()
                }
                else {
                    self.showOfflineDataAlertOption()
                }
            }
            catch {
                print("Exception in composePost while netword check : \(error.localizedDescription)")
            }
        }
    }
    
    func postValidation() -> Bool {
        if videoTitle.trimmingCharacters(in: .whitespacesAndNewlines) != videoTitlePlaceHolder && !videoTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            if self.videoURL == nil {
                return false
            }
            return true
        }
        else {
            EPICAIGenericAlertView().show(title: "EPICAI Alert!", message: "Put title for your video", onViewController: self) { }
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension EPICAIComposePost : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var listCell = EPICAIComposePostPCell()
        
        if indexPath.row == 0 {
            listCell = tableView.dequeueReusableCell(withIdentifier: EPICAIComposePostPCell.identifierProfile) as! EPICAIComposePostPCell
            return listCell
        }
        else if indexPath.row == 1 {
            listCell = tableView.dequeueReusableCell(withIdentifier: EPICAIComposePostPCell.identifierText) as! EPICAIComposePostPCell
            listCell.delegate = self
            return listCell
        }
        else if indexPath.row == 2 {
            let videoCell = tableView.dequeueReusableCell(withIdentifier: EPICAIComposePostPlayerCell.identifier) as! EPICAIComposePostPlayerCell
            if let videoURL = self.videoURL {
                videoCell.videoURL = videoURL
            }
            return videoCell
        }
        else {
            let actionCell = tableView.dequeueReusableCell(withIdentifier: EPICAIComposePostUploadActionCell.identifier, for: indexPath) as! EPICAIComposePostUploadActionCell
            actionCell.uploadAcknowledgement = {
                self.composePost()
            }
            return actionCell
        }
    }
}

extension EPICAIComposePost : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        }
        else if indexPath.row == expandingIndexRow {
            return expandingCellHeight
        }
        else if indexPath.row == 2 {
            return 250
        }
        else {
            return 70
        }
    }
}

extension EPICAIComposePost: ExpandingCellDelegate {
    
    func updatedHeight(height: CGFloat,textView: UITextView)
    {
        videoTitle = textView.text
        expandingCellHeight = height
        UIView.setAnimationsEnabled(false)
        postTV.beginUpdates()
        postTV.endUpdates()
        UIView.setAnimationsEnabled(true)
        let indexPath = IndexPath(row: expandingIndexRow, section: 0)
        postTV.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
}


fileprivate extension EPICAIComposePost {
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyBoardValueBegin = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
              let keyBoardValueEnd = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, keyBoardValueBegin != keyBoardValueEnd else {
                  return
              }
        let keyboardHeight = keyBoardValueEnd.height
        postTV.contentInset.bottom = keyboardHeight
    }
}

extension EPICAIComposePost : EPICAILocationManagerDelegate {
    func deviceCurrentLocDetails(errorWhilegettingGeoCode: Bool, location: CLLocation) {
        EPICAILocationManager.dispose()
        if !errorWhilegettingGeoCode { self.currentLocation = location }
    }
}




