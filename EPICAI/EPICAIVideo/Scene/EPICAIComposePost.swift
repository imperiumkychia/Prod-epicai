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

class EPICAIComposePost : UIViewController {
    
    @IBOutlet weak var postTV: UITableView!
    @IBOutlet weak var closeBtn:UIButton!
    
    var videoURL:URL?
    var currentLocation:CLLocation?
    var videoTitle = videoTitlePlaceHolder
    var expandingCellHeight: CGFloat = 60
    let expandingIndexRow = 2
    var imageArrName:[String] = []
    
    @IBAction func moveBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        let locationManager:EPICAILocationManager = EPICAILocationManager.shared
        locationManager.delegate = self
        super.viewDidLoad()
        self.closeBtn.setTitle("", for: .normal)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func submit(_ sender: Any) {
        print("Submit clicked")
    }
    
    func isFormValidated() -> Bool {
        if videoTitle == videoTitlePlaceHolder {
            self.videoTitle = ""
        }
        return true
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var listCell = PostCellTV()
        
        if indexPath.row == 0 {
            listCell = tableView.dequeueReusableCell(withIdentifier: PostCellTV.identifierProfile) as! PostCellTV
            return listCell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ResultWithVideoCell.identifier) as! ResultWithVideoCell
            return cell
        }
        else if indexPath.row == 2 {
            listCell = tableView.dequeueReusableCell(withIdentifier: PostCellTV.identifierText) as! PostCellTV
            //listCell.textViewData(creadtedText : textViewText)
            listCell.delegate = self
            return listCell
        }
        else if indexPath.row == 3{
            listCell = tableView.dequeueReusableCell(withIdentifier: PostCellTV.identifierImageVideo) as! PostCellTV
            return listCell
        }
        else {
            if indexPath.row == 4 {
                let actionCell = tableView.dequeueReusableCell(withIdentifier: CreatePostActionCell.identifier, for: indexPath) as! CreatePostActionCell
                return actionCell
            }
        }
        return UITableViewCell()
    }
}

extension EPICAIComposePost : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        }
        if indexPath.row == 1 {
            return 50
        }
        else if indexPath.row == expandingIndexRow {
            return expandingCellHeight
        }
        else if indexPath.row == 3 {
            return 250
        }
        else {
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        if let videoCell = cell as? ASAutoPlayVideoLayerContainer, let _ = videoCell.videoURL {
        //            ASVideoPlayerController.sharedVideoPlayer.removeLayerFor(cell: videoCell)
        //        }
    }
    
    //    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    //        pausePlayeVideos()
    //    }
    //
    //    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    //        if !decelerate {
    //            pausePlayeVideos()
    //        }
    //    }
    
    //    func pausePlayeVideos(){
    //        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: self.postTV)
    //    }
    //
    //    @objc func appEnteredFromBackground() {
    //        ASVideoPlayerController.sharedVideoPlayer.pausePlayeVideosFor(tableView: self.postTV, appEnteredFromBackground: true)
    //    }
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
        if errorWhilegettingGeoCode {
           print("Error while getting location : \(errorWhilegettingGeoCode)")
        }
        else {
            self.currentLocation = location
            print("Location location : \(location)")
        }
    }
}




