//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//
import UIKit
import JGProgressHUD

class EPICAIVideoDetailsVC: UIViewController {

    
    let itemsMargin: CGFloat = 20.0
    
    private var dateFormatter = DateFormatter()
    private let targetDateFormat = "dd/MM/yyyy"
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    
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
    
    lazy var settingsButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped(_:)), for: .touchUpInside)
        return button
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
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockTouchesOnHUDView
        return indicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUIElements()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        if let tbar = tabBarController as? GenericTabBarController{
            tbar.floatingTabbarView.toggle(hide: false)
        }
    }
    
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
        
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        view.addSubview(videoDetailTableView)
        view.addSubview(ai)
        
        backButton.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(itemsMargin)
            make.top.equalTo(view.snp.topMargin).offset(itemsMargin)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(backButton.snp.trailing).offset(itemsMargin)
            make.centerY.equalTo(backButton)
        }
        
        settingsButton.snp.makeConstraints { (make) in
            make.width.equalTo(40.0)
            make.height.equalTo(40.0)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        videoDetailTableView.snp.makeConstraints { (make) in
            make.top.equalTo(settingsButton.snp.bottom).offset(itemsMargin)
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
            cell.videoName = videoItem?.video.videoName
            cell.videoDate = formattedDateString(string: videoItem?.video.dataTime)
            cell.videoScore = "score: 60/10"
            
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

        
        let shareAction = UIAlertAction(title: "Share", style: .default) { action in
            
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { action in
            self.deleteVideoFlow()
        }
        
        controller.addAction(cancelAction)
        controller.addAction(renameAction)
        controller.addAction(shareAction)
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
            AuthService.shared().getCurrentUserUUID { uid in
                if let uid = uid,
                   let videoItem = self.videoItem,
                   
                    uid == videoItem.user.uuid {
                    
                    DispatchQueue.main.async {
                        self.ai.textLabel.text = "Deleting video..."
                        self.ai.show(in: self.view, animated: true)
                    }
                    
                    /// Deleting video on the API
                   /* APIHandler.shared().deleteVideo(video: videoItem.video) { error in
                        if let error = error {
                            print("Error deleting video via API: \(error)")
                            DispatchQueue.main.async {
                                self.ai.dismiss()
                                GenericAlertView().show(title: "Error", message: "\(error.localizedDescription)", onViewController: self, isShort: false) {}
                            }
                        } else {
                            /// Deleting from S3
                            AWSManager.shared().removeVideo(key: videoName) { didRemoveVideo in
                                print("Video deleted from S3: \(didRemoveVideo)")
                                DispatchQueue.main.async {
                                    NotificationCenter.default.post(name: .didRenamePrivateVideo, object: nil, userInfo: nil)
                                    NotificationCenter.default.post(name: .didAddNewPublicVideo, object: nil, userInfo: nil)
                                    self.ai.dismiss()
                                    GenericAlertView().show(title: "Success", message: "Successfully deleted the video.", onViewController: self, isShort: true) {
                                        _ = self.navigationController?.popViewController(animated: true)
                                    }
                                }
                            }
                            AWSManager.shared().removeLogForVideoWith(key: videoName)
                        }
                    }*/
                    
                    
                } else {
                    DispatchQueue.main.async {
                        EPICAIGenericAlertView().show(title: "Error", message: "You are not allowed to delete this video.", onViewController: self) {}
                    }
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = self.view.bounds
        present(alert, animated: true)
    }
    
    func renameVideoFlow() {
        if let video = self.videoItem,
           let localURL = video.videoLocalURL {
            
            /// Set video name
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .alert)
            actionSheet.view.tintColor = Palette.V2.V2_VCTitle
            let titleAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(20.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
            let titleString = NSAttributedString(string: "Rename video", attributes: titleAttributes)
            actionSheet.setValue(titleString, forKey: "attributedTitle")
            
            actionSheet.addTextField { (textfield) in
                textfield.placeholder = "Leave blank for automatic naming"
                textfield.textColor = Palette.V2.V2_VCTitle
                textfield.font = LatoFont.regular.withSize(13.0)
                textfield.delegate = self
            }
            
            let applyAction = UIAlertAction(title: "Apply", style: .default) { (action) in
                DispatchQueue.main.async {
                    self.ai.textLabel.text = "Renaming video..."
                    self.ai.show(in: self.view, animated: true)
                }
                if let currentText = actionSheet.textFields?.first?.text {
                    var newName: String = ""
                    if currentText == "" {
                        /// Automatic naming
                        newName = UUID().uuidString + ".mov"
                    } else {
                        /// Manual naming
                        newName = currentText + ".mov"
                    }
                    
                    AWSManager.shared().nameExistsOnS3(key: newName) { result in
                        switch result {
                        case .success(let exists):
                            if exists {
                                DispatchQueue.main.async {
                                    EPICAIGenericAlertView().show(title: "Error", message: "A video with this name already exists on database. Plase choose a different name and try again.", onViewController: self) {}
                                    self.ai.dismiss()
                                }
                            } else {
                                /// Rename on API
                                var newVideo = video.video
                                newVideo.videoName = video.video.videoName
                                
                             /*   APIHandler.shared().updateVideo(video: newVideo) { error in
                                    if let error = error {
                                        print("Error updating video via API: \(error)")
                                        DispatchQueue.main.async {
                                            GenericAlertView().show(title: "Error", message: "\(error.localizedDescription)", onViewController: self) {}
                                        }
                                        self.ai.dismiss()
                                        return
                                    } else {
                                        /// Rename on S3
                                        AWSManager.shared().renameVideo(key: currentName, localURL: localURL, newKey: newName) { (succeeded) in
                                            if succeeded {
                                                AWSManager.shared().renameLogForVideoWith(key: currentName, newKey: newName)
                                                self.videoItem?.video = newVideo
                                                DispatchQueue.main.async {
                                                    if video.video.share == "1" {
                                                        NotificationCenter.default.post(name: .didRenamePrivateVideo, object: nil, userInfo: nil)
                                                        NotificationCenter.default.post(name: .didAddNewPublicVideo, object: nil, userInfo: nil)
                                                    } else {
                                                        NotificationCenter.default.post(name: .didRenamePrivateVideo, object: nil, userInfo: nil)
                                                    }
                                                    self.videoDetailTableView.reloadData()
                                                    GenericAlertView().show(title: "Success", message: "Successfully renamed video.", onViewController: self, isShort: true) {}
                                                    self.ai.dismiss()
                                                }
                                            } else {
                                                DispatchQueue.main.async {
                                                    GenericAlertView().show(title: "Error", message: "Unable to rename the video.", onViewController: self) {}
                                                    self.ai.dismiss()
                                                }
                                                /// Revert name to original name
                                                APIHandler.shared().updateVideo(video: video.video) { error in
                                                    print("Unable to revert name to original name: \(String(describing: error))")
                                                }
                                            }
                                        }
                                    }
                                }*/
                            }
                        default:
                            DispatchQueue.main.async {
                                self.ai.dismiss()
                            }
                            break
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.ai.dismiss()
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
        } else {
            DispatchQueue.main.async {
                EPICAIGenericAlertView().show(title: "Error", message: "You are not allowed to rename this video.", onViewController: self) {}
            }
        }
    }
}

extension EPICAIVideoDetailsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
