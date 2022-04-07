//
//  SceneDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import UIKit
import JGProgressHUD
import Amplify

class EPICAIProfileVC: UIViewController {
    
    var profileViewModel: EPICAIProfileVM!
    let itemsMargin: CGFloat = 20.0
    var otherUserDetails:EPICAIUser?
    var items = [EPICAIFeedItem]()
    var userItem: EPICAIUserAccountItem?
    
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
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    var refreshControl: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(reloadVideoList), for: .valueChanged)
        return controll
    }()
    
    lazy var profileTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(ProfileUserInfoCell.self, forCellReuseIdentifier: "ProfileUserInfoCell")
        table.register(ProfileOverviewCell.self, forCellReuseIdentifier: "ProfileOverviewCell")
        //table.register(ProfileStatusCell.self, forCellReuseIdentifier: "ProfileStatusCell")
        table.register(ProfileVideosCell.self, forCellReuseIdentifier: "ProfileVideosCell")
        table.register(FeedsEmptyCell.self, forCellReuseIdentifier: "feedsEmptyCell")
        table.separatorStyle = .none
        table.backgroundColor = self.view.backgroundColor
        table.showsVerticalScrollIndicator = false
        table.addSubview(refreshControl)
        return table
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockTouchesOnHUDView
        return indicator
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.otherUserDetails != nil {
            self.leftMenuItems()
        }
        else {
            self.rightMenuItems()
        }
        setupUIElements()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Profile"
        self.applyCustomAppearance()
        if let tbar = tabBarController as? GenericTabBarController{
            tbar.floatingTabbarView.toggle(hide: false)
        }
        initializeViewModel()
    }
    
    func initializeViewModel() {
        profileViewModel = EPICAIProfileVM(user: self.otherUserDetails)
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        
        profileViewModel.onUserInfoChange = { item in
            self.userItem = item
            DispatchQueue.main.async {
                self.profileTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            }
        }
        
        profileViewModel.onReceiveVideos = { items in
            if let items = items {
                self.profileViewModel.getVideoLocalURLs(for: items)
            } else {
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        
        profileViewModel.onReceiveVideosURLs = { itemsWithURL in
            if let itemsWithURL = itemsWithURL {
                DispatchQueue.main.async {
                    self.items = itemsWithURL.sorted(by: { $0.videoDate! > $1.videoDate! })
                    self.profileTableView.reloadData()
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        profileViewModel.getUserInfo()
        profileViewModel.getVideosList()
    }
    
    func setupUIElements() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shouldRefreshFeedsTable(_:)),
                                               name: .didAddNewPublicVideo,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateUserInfo(_:)),
                                               name: .userInfoUpdated,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shouldRefreshFeedsTable(_:)),
                                               name: .didRenamePrivateVideo,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shouldMoveToRoot(_:)),
                                               name: .didChageTabCalled,
                                               object: nil)
        
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(profileTableView)
        view.addSubview(ai)
        
        profileTableView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(itemsMargin)
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
    }
    
    private func rightMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        self.settingsButton.frame = CGRect(x: 20, y: 5, width: 30, height: 30)
        rightOptionView.addSubview(self.settingsButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.rightBarButtonItem = rightBaritem
    }
    
    @objc func settingsButtonTapped(_ sender: UIButton) {
        guard let toVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "EPICAISettingsVC") as? EPICAISettingsVC else { return }
        navigationController?.pushViewController(toVC, animated: true)
    }
    
    @objc func reloadVideoList() {
        self.refreshProfileData()
    }
    
    @objc func updateUserInfo(_ notification: Notification) {
        profileViewModel.getUserInfo()
    }
    
    @objc func shouldRefreshFeedsTable(_ notification: Notification) {
        refreshProfileData()
    }
    
    @objc func shouldMoveToRoot(_ notification: Notification) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    private func refreshProfileData() {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        initializeViewModel()
    }
}


extension EPICAIProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 1
        case 3:
            return 1
        default:
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return (self.otherUserDetails == nil) ? 110.0 : 150
        case 1:
            return 260.0
        case 3:
            return 200.0
        default:
            return 650.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUserInfoCell", for: indexPath) as? ProfileUserInfoCell else { return UITableViewCell() }
            cell.userDetails =  self.userItem?.user
            cell.moveToUserList = { follow in
                self.routeToUserList(follow: follow)
            }
            cell.updateFollowStatus = { followState in
                if var otherUser = self.otherUserDetails {
                    self.profileViewModel.performFollow(state: !followState, selectedUser: otherUser) { successState in
                        if successState {
                            otherUser.followStatus = !followState
                            cell.userDetails =  otherUser
                        }
                    }
                }
                
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileOverviewCell", for: indexPath) as? ProfileOverviewCell else { return UITableViewCell() }
            let result = self.items.map { Double($0.video.score)}
            cell.data = result //[6, 9, 9, 7, 9, 9, 9, 8,10, 14, 23, 9,40, 7,7,7,7,7,35,30]
            cell.score = (result.sum() > 0) ? CGFloat(CGFloat(result.sum()) / CGFloat(result.count)) : 0.0
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVideosCell", for: indexPath) as? ProfileVideosCell else { return UITableViewCell() }
            cell.delegate = self
            cell.user = self.otherUserDetails
            cell.item = items[indexPath.row]
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedsEmptyCell", for: indexPath) as? FeedsEmptyCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    private func routeToUserList(follow:Bool) {
        let vc = EPICAIFollowListVC.instantiateFromAppStoryBoard(appStoryBoard: .UsersStoryboard)
        vc.follow  = follow
        vc.otherUser = self.otherUserDetails
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            if self.otherUserDetails == nil {
                let toVC = EPICAIVideoDetailsVC()
                toVC.videoItem = items[indexPath.row]
                navigationController?.pushViewController(toVC, animated: true)
            }
        default:
            break
        }
    }
}

extension EPICAIProfileVC: ProfileVideosCellDelegate {
    
    func profileVideoCell(_ cell: ProfileVideosCell, didAskToShareVideoItem item: EPICAIFeedItem?) {
        guard let video = item?.video else { return }
        self.showActionSheet(videoItem: video, indexPath: cell.indexPath)
        //let viewController  = EPICAIVideoDetailsVC()
        //viewController.videoItem = item
        //self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showActionSheet(videoItem:EPICAIVideo,indexPath:IndexPath?) {
        let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        controller.view.tintColor = Palette.V2.V2_VCTitle
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        let resultWithVideoAction = UIAlertAction(title: "Result with video", style: .default) { action in
            self.shareVideoWithVideoFlow(videoWithResult: true, videoItem: videoItem, indexPath: indexPath)
        }
        let shareAction = UIAlertAction(title: "Result only", style: .default) { action in
            self.shareVideoWithVideoFlow(videoWithResult: false, videoItem: videoItem, indexPath: indexPath)
        }
        controller.addAction(cancelAction)
        
        if videoItem.share == 1 && videoItem.videoShare == 0 {
            controller.addAction(resultWithVideoAction)
        }
        else if videoItem.share == 0 && videoItem.videoShare == 0 {
            controller.addAction(resultWithVideoAction)
            controller.addAction(shareAction)
        }
        self.present(controller, animated: true) {}
    }
    
    func shareVideoWithVideoFlow(videoWithResult:Bool, videoItem:EPICAIVideo, indexPath:IndexPath?) {
        
        self.showLoader(withTitle: "Sharing video")
        
        let videoUpdateMutaionInput = (videoWithResult) ? UpdateVideoInput(videoUuid: videoItem.videoUUID, share: 1 ,shareVideo: 1) : UpdateVideoInput(videoUuid: videoItem.videoUUID, share: 1)
        
        self.updateVideoDetails(videoMutationInput: videoUpdateMutaionInput) { error in
            if let error = error {
                print("Error while updating video title:\(error.localizedDescription)")
            }
            else {
                DispatchQueue.main.async {
                    guard let indexPath = indexPath else { return }
                    if videoWithResult {
                        self.items[indexPath.row].video.share = 1
                        self.items[indexPath.row].video.videoShare = 1
                    }
                    else {
                        self.items[indexPath.row].video.share = 1
                    }
                    self.profileTableView.reloadRows(at: [indexPath], with: .fade)
                    EPICAIGenericAlertView().show(title: "Success", message: "Video details updated successfully.", onViewController: self) {}
                }
            }
            self.hideLoader()
        }
    }
    
    private func showLoader(withTitle:String) {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "\(withTitle)..."
            self.ai.show(in: self.view, animated: true)
        }
    }
    
    private func hideLoader() {
        DispatchQueue.main.async {
            self.ai.dismiss()
        }
    }
    
    func updateVideoDetails(videoMutationInput:UpdateVideoInput, completion:@escaping (Error?) -> Void) {
        appSyncClient?.perform(mutation: UpdateVideoMutation(updateVideoInput: videoMutationInput), resultHandler: { result, error in
            if let error = error {
                completion(error)
            }
            else if let errors = result?.errors {
                completion(errors[0])
            }
            else {
                completion(nil)
            }
        })
    }
    
    func profileVideoCell(_ cell: ProfileVideosCell, didAskToShareVideoWithUUID videoUUID: String?) {
        
    }
}
