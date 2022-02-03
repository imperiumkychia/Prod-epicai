//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//
import UIKit
import JGProgressHUD
import Amplify

class EPICAIVideoDetailsVC: UIViewController {
    
    
    let itemsMargin: CGFloat = 20.0
    
    private var dateFormatter = DateFormatter()
    private let targetDateFormat = "dd/MM/yyyy"
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    var indexPath:IndexPath?
    var videoItem: EPICAIFeedItem?
    var gaugeData: Double = RandomDataGenerator.generateRandomGaugeData()
    var tonalityData = RandomDataGenerator.generateRandomTonalityData()
    var pieChartData = RandomDataGenerator.generateRandomPieChartData(numberOfCategories: 4)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.font = LatoFont.bold.withSize(27.0)
        label.textColor = Palette.V2.V2_VCTitle
        return label
    }()
    
    
    
    lazy var videoDetailTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(VideoNameCell.self, forCellReuseIdentifier: "VideoNameCell")
        table.register(VideoBodyLanguageCell.self, forCellReuseIdentifier: "VideoBodyLanguageCell")
        table.register(VideoHighlightsCell.self, forCellReuseIdentifier: "VideoHighlightsCell")
        table.register(VideoSpeedOfSpeechCell.self, forCellReuseIdentifier: "VideoSpeedOfSpeechCell")
        table.register(VideoTonalityCell.self, forCellReuseIdentifier: "VideoTonalityCell")
        table.register(VideoFillerWords.self, forCellReuseIdentifier: "VideoFillerWords")
        
        table.separatorStyle = .none
        table.backgroundColor = self.view.backgroundColor
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    lazy var settingsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        let img = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30.0, weight: .bold))
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockTouchesOnHUDView
        return indicator
    }()
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    //    private func rightMenuItems() {
    //        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
    //        rightOptionView.addSubview(self.settingsButton)
    //        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
    //        self.navigationItem.rightBarButtonItem = rightBaritem
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftMenuItems()
        //self.rightMenuItems()
        setupUIElements()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.applyCustomAppearance()
        self.title = "Video details"
        
        if let tbar = tabBarController as? GenericTabBarController{
            tbar.floatingTabbarView.toggle(hide: false)
        }
    }
    
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(videoDetailTableView)
        view.addSubview(ai)
        
        videoDetailTableView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(itemsMargin)
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
        
    }
    
    @objc func settingsButtonTapped(_ sender: UIButton) {
        guard let toVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfileSettingsViewController") as? EPICAISettingsVC else { return }
        navigationController?.pushViewController(toVC, animated: true)
    }
    
    func formattedDateString(string: String?) -> String? {
        dateFormatter.dateFormat = originalDateFormat
        guard let string = string, let date = dateFormatter.date(from: string) else { return nil }
        dateFormatter.dateFormat = targetDateFormat
        return dateFormatter.string(from: date)
    }
    
}


extension EPICAIVideoDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 110.0
        case 2:
            return 350.0
        case 3:
            return 370.0
        case 5:
            return 240.0
        default:
            return 260.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoNameCell", for: indexPath) as? VideoNameCell else { return UITableViewCell() }
            
            cell.delegate = self
            cell.videoUUID = videoItem?.video.videoUUID
            cell.videoName = videoItem?.video.title
            cell.videoDate = formattedDateString(string: videoItem?.video.dataTime)
            cell.videoScore = "Score: 60/100"
            
            return cell
        }
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoBodyLanguageCell", for: indexPath) as? VideoBodyLanguageCell else { return UITableViewCell() }
            
            cell.categories = [(title: "Hand in pocket",
                                color: Palette.V2.V2_pieChartRed,
                                percentage: pieChartData[0]),
                               (title: "Touch chin",
                                color: Palette.V2.V2_pieChartYellow,
                                percentage: pieChartData[1]),
                               (title: "Cross arm",
                                color: Palette.V2.V2_pieChartBlue,
                                percentage: pieChartData[2]),
                               (title: "Normal",
                                color: Palette.V2.V2_pieChartGreen,
                                percentage: pieChartData[3])]
            
            return cell
        }
        
        if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoHighlightsCell", for: indexPath) as? VideoHighlightsCell else { return UITableViewCell() }
            
            cell.videoURL = videoItem?.videoLocalURL
            cell.explanation = "Dynamic text that describes all detected bad posture"
            return cell
        }
        
        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoSpeedOfSpeechCell", for: indexPath) as? VideoSpeedOfSpeechCell else { return UITableViewCell() }
            
            cell.value = gaugeData
            
            return cell
        }
        
        if indexPath.row == 4 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTonalityCell", for: indexPath) as? VideoTonalityCell else { return UITableViewCell() }
            
            cell.data = tonalityData
            
            return cell
        }
        
        if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoFillerWords", for: indexPath) as? VideoFillerWords else { return UITableViewCell() }
            
            cell.data = [(title: "Um", color: Palette.V2.V2_fillerWordsGrey, value: 10),
                         (title: "You Know", color: Palette.V2.V2_fillerWordsLightBlue, value: 7),
                         (title: "I Mean", color: Palette.V2.V2_fillerWordsBlue, value: 4)]
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
}

extension EPICAIVideoDetailsVC: VideoNameCellDelegate {
    
    func videoNameCell(_ cell: VideoNameCell, didAskToShowMoreForVideo videoUUID: String?) {
        
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        controller.view.tintColor = Palette.V2.V2_VCTitle
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        let renameAction = UIAlertAction(title: "Rename", style: .default) { action in
            self.renameVideoFlow()
        }
        
        let resultWithVideoAction = UIAlertAction(title: "Result with video", style: .default) { action in
            self.shareVideoWithVideoFlow(videoWithResult: true)
        }
        
        let shareAction = UIAlertAction(title: "Result only", style: .default) { action in
            self.shareVideoWithVideoFlow(videoWithResult: false)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { action in
            self.deleteVideoFlow()
        }
        
        controller.addAction(cancelAction)
        controller.addAction(renameAction)
        
        if let video = self.videoItem?.video {
            print("Videoshare:\(video.videoShare) share:\(video.share)")
            if video.share == 1 && video.videoShare == 0 {
                controller.addAction(resultWithVideoAction)
            }
            else if video.share == 0 && video.videoShare == 0 {
                controller.addAction(resultWithVideoAction)
                controller.addAction(shareAction)
            }
        }
        controller.addAction(deleteAction)
        self.present(controller, animated: true) {
        }
    }
    
    func deleteVideoFlow() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.view.tintColor = Palette.V2.V2_VCTitle
        let titleAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(20.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
        let titleString = NSAttributedString(string: "Delete video", attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        let messageAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(17.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
        let messageString = NSAttributedString(string: "Are you sure you want to delete this video?", attributes: messageAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.setValue(messageString, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: "Delete", style: .default) { _ in
            self.performDeleteVideo()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = self.view.bounds
        present(alert, animated: true)
    }
    
    func showLoader(withTitle:String) {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "\(withTitle)..."
            self.ai.show(in: self.view, animated: true)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.ai.dismiss()
        }
    }
    
    func performDeleteVideo() {
        if let video = self.videoItem?.video {
            self.showLoader(withTitle: "Deleting video")
            let updateVideoInput =  UpdateVideoInput(videoUuid: video.videoUUID, active: 0)
            appSyncClient?.perform(mutation: UpdateVideoMutation(updateVideoInput: updateVideoInput), resultHandler: { result, error in
                if let error = error {
                    print("Error in deleting video : \(error.localizedDescription)")
                }
                else if let errors = result?.errors {
                    print("Error in deleting video : \(errors[0].localizedDescription)")
                }
                else {
                    print("Result : \(String(describing: result))")
                    DispatchQueue.main.async {
                        EPICAIGenericAlertView().show(title: "Success", message: "Video deleted successfully.", onViewController: self) {
                            NotificationCenter.default.post(name: .didAddNewPublicVideo, object: nil, userInfo: nil)
                            self.backButtonTapped(self.backButton)
                        }
                    }
                }
                self.hideLoader()
            })
        }
    }
    
    func renameVideoFlow() {
        if let video = self.videoItem {
            /// Set video name
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .alert)
            actionSheet.view.tintColor = Palette.V2.V2_VCTitle
            let titleAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(20.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
            let titleString = NSAttributedString(string: "Update title", attributes: titleAttributes)
            actionSheet.setValue(titleString, forKey: "attributedTitle")
            
            actionSheet.addTextField { (textfield) in
                textfield.placeholder = "Update title"
                textfield.textColor = Palette.V2.V2_VCTitle
                textfield.font = LatoFont.regular.withSize(13.0)
                textfield.delegate = self
            }
            
            let applyAction = UIAlertAction(title: "Apply", style: .default) { (action) in
                if let currentText = actionSheet.textFields?.first?.text {
                    if !currentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                        self.updateTitle(currentText, video: video.video)
                    }
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            actionSheet.addAction(applyAction)
            actionSheet.addAction(cancelAction)
            /// Important for iPad
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = self.view.bounds
            DispatchQueue.main.async {
                self.present(actionSheet, animated: true)
            }
        }
    }
    
    func shareVideoWithVideoFlow(videoWithResult:Bool) {
        
        if let videoDetails = self.videoItem?.video {
            self.showLoader(withTitle: "Sharing video")
            
            let videoUpdateMutaionInput = (videoWithResult) ? UpdateVideoInput(videoUuid: videoDetails.videoUUID, share: 1 ,shareVideo: 1) : UpdateVideoInput(videoUuid: videoDetails.videoUUID, share: 1)
            
            self.updateVideoDetails(videoMutationInput: videoUpdateMutaionInput) { error in
                if let error = error {
                    print("Error while updating video title:\(error.localizedDescription)")
                }
                else {
                    DispatchQueue.main.async {
                        EPICAIGenericAlertView().show(title: "Success", message: "Video details updated successfully.", onViewController: self) {}
                    }
                }
                self.hideLoader()
            }
        }
    }
    
    func updateTitle(_ title:String, video:EPICAIVideo) {
        self.showLoader(withTitle: "Update title")
        let videoUpdateMutaionInput = UpdateVideoInput(videoUuid: video.videoUUID, title: title)
        self.updateVideoDetails(videoMutationInput: videoUpdateMutaionInput) { error in
            if let error = error {
                print("Error while updating video title:\(error.localizedDescription)")
            }
            else {
                DispatchQueue.main.async {
                    EPICAIGenericAlertView().show(title: "Success", message: "Video details updated successfully.", onViewController: self) {}
//                    self.progressDiscard(videoUUID: video.videoUUID) { state in
//                        print("Delete video from s3 bucked : \(state)")
//                    }
                }
            }
            self.hideLoader()
        }
    }
    
    
    func updateVideoDetails(videoMutationInput:UpdateVideoInput, completion:@escaping (Error?) -> Void) {
        appSyncClient?.perform(mutation: UpdateVideoMutation(updateVideoInput: videoMutationInput), resultHandler: { result, error in
            if let error = error {
                completion(error)
                print("Title update error : \(error.localizedDescription)")
            }
            else if let errors = result?.errors {
                completion(errors[0])
                print("Title update error : \(errors[0].localizedDescription)")
            }
            else {
                completion(nil)
            }
        })
    }
}

extension EPICAIVideoDetailsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func progressDiscard(videoUUID:String, completion:@escaping (Bool) -> Void) {
        self.removeVideoIfUserDiscard(videoUUID: videoUUID) { state , error in
            if let error = error {
                print("Video delete error:\(error.localizedDescription)")
            }
            print("Video delete state \(state)")
        }
        
        self.removeBodyPointsCSVIfUserDiscard(videoUUID: videoUUID) { state, error  in
            if let error = error {
                print("Body points csv delete error:\(error.localizedDescription)")
            }
            print("Body point scv delete state \(state)")
        }
        
        self.removeAudioCSVIfUserDiscard(videoUUID: videoUUID) { state, error in
            if let error = error {
                print("Audio points csv delete error:\(error.localizedDescription)")
            }
            print("Audio csv delete state \(state)")
        }
    }
    
    func removeVideoIfUserDiscard(videoUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: videoBucketkey + videoUUID + videoExtension , resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeBodyPointsCSVIfUserDiscard(videoUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: bodyPointBucketkey + videoUUID + ".csv", resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
    
    func removeAudioCSVIfUserDiscard(videoUUID:String, completion:@escaping (Bool, Error?) -> Void) {
        _ = Amplify.Storage.remove(key: audioPointBucketkey + videoUUID + ".csv" , resultListener: { result in
            switch(result) {
            case .success( _): completion(true, nil)
            case .failure(let error): completion(false, error)
            }
        })
    }
}
