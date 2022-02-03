//
//  ViewController.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import SnapKit
import FSPagerView
import JGProgressHUD
import SwiftUI
import CoreMedia


class EPICAIFeedController: UIViewController {
    
    let mainQueue = DispatchQueue.main
    let itemsMargin: CGFloat = 20.0
    
    var items = [EPICAIFeedItem]() {
        didSet {
            lastPagerViewIndices = [Int](repeating: 0, count: items.count)
        }
    }
    var lastPagerViewIndices = [Int]()
    var followingFlag  = false
    
    var viewModel: EPICAIFeedVM!
    
    let secodaryTitle:UILabel  = {
        let titlelbl1 = UILabel(frame: .zero)
        titlelbl1.text = "Following"
        titlelbl1.textColor = Palette.V2.V2_VCTitle
        titlelbl1.font = LatoFont.bold.withSize(13)
        titlelbl1.textAlignment = NSTextAlignment.left
        return titlelbl1
    }()
    
    let searchButton:UIButton = {
        let button = UIButton(frame: .zero)
        let img = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .semibold))
        button.tintColor = Palette.V2.V2_VCTitle
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(moveToSeachUsers(_:)), for: .touchUpInside)
        return button
    }()
    
    let notificationButton:UIButton = {
        let button = UIButton(frame: .zero)
        let img = UIImage(systemName: "bell.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .semibold))
        button.setImage(img, for: .normal)
        button.tintColor = Palette.V2.V2_VCTitle
        button.addTarget(self, action: #selector(moveToNotification(_:)), for: .touchUpInside)
        return button
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockAllTouches
        return indicator
    }()
    
    lazy var feedsTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "FeedsCell", bundle: nil), forCellReuseIdentifier: "feedsCell")
        table.register(FeedsEmptyCell.self, forCellReuseIdentifier: "feedsEmptyCell")
        table.separatorStyle = .none
        table.backgroundColor = self.view.backgroundColor
        table.showsVerticalScrollIndicator = false
        table.addSubview(refreshControl)
        return table
    }()
    
    let randomGaugeData = RandomDataGenerator.generateRandomGaugeData()
    let randomPieChartData = RandomDataGenerator.generateRandomPieChartData(numberOfCategories: 4)
    let randomTonalityData = RandomDataGenerator.generateRandomTonalityData()
    
    var refreshControl: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(initiateVideoModel), for: .valueChanged)
        return controll
    }()
    
    @objc func moveToSeachUsers(_ sender:UIButton) {
        
    }
    
    @objc func moveToNotification(_ sender:UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User details = \(String(describing: EPICAISharedPreference.userSession))")
        
        self.title = "Feeds"
        self.applyCustomAppearance()
        self.rightMenuItems()
        self.leftMenuItems()
        setupUIElements()
        initiateVideoModel()
    }
    
    private func rightMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 50, y: 1, width: 130, height: 49))
        self.searchButton.frame = CGRect(x: 60, y: 10, width: 30, height: 30)
        self.notificationButton.frame = CGRect(x: 100, y: 10, width: 30, height: 30)
        rightOptionView.addSubview(searchButton)
        rightOptionView.addSubview(notificationButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.rightBarButtonItem = rightBaritem
    }
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 0, y: 1, width: 110, height: 45))
        let deviceType = UIDevice().type
        let followingSwicth = UISwitch(frame: CGRect(x: 53, y: 7, width: 40, height: 20))
        followingSwicth.onTintColor = Palette.darkPurple
        var titlelbl1Rect = CGRect()
        switch deviceType {
        case .iPhoneSE,.iPhoneSE2,.iPhone5, .iPhone5S,.iPhone5C, .iPhone6, .iPhone7, .iPhone8:
            followingSwicth.transform = CGAffineTransform(scaleX: 0.60, y: 0.60)
            titlelbl1Rect = CGRect(x: 0, y: 10, width: 60, height: 20)
        default:
            followingSwicth.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
            titlelbl1Rect = CGRect(x: 0, y: 15, width: 70, height: 15)
        }
        followingSwicth.addTarget(self, action: #selector(self.detectionSwitchHandler(sender:)), for: .valueChanged)
        secodaryTitle.frame = titlelbl1Rect
        
        leftOptionView.addSubview(secodaryTitle)
        leftOptionView.addSubview(followingSwicth)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    @objc func detectionSwitchHandler(sender:UISwitch) {
        if sender.isOn {
        }
        else {
        }
        print("Switch on off")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(ai)
        view.addSubview(feedsTableView)
        
        feedsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.bottom.equalTo(view)
            make.leading.equalTo(view).offset(itemsMargin)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        lastPagerViewIndices = [Int](repeating: 0, count: items.count)
    }
    
    @objc func initiateVideoModel() {
        self.viewModel = EPICAIFeedVM()
        self.feedsTableView.reloadData()
        self.viewModel.onReceiveVideos = { items in
            if let items = items {
                self.viewModel.getVideoLocalURLs(for: items)
            } else {
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        
        self.viewModel.onReceiveVideosURLs = { itemsWithURL in
            if let itemsWithURL = itemsWithURL {
                DispatchQueue.main.async {
                    self.items = itemsWithURL.sorted(by: { $0.videoDate! > $1.videoDate! })
                    print("Feed items:\(self.items)")
                    self.feedsTableView.reloadData()
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        refreshFeedsData()
    }
    
    @objc func shouldRefreshFeedsTable(_ notification: Notification) {
        refreshFeedsData()
    }
    
    
    @objc func updateUserInfo(_ notification: Notification) {
        refreshFeedsData()
    }
    
    private func showLoader() {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
    }
    
    private func hideLoader() {
        DispatchQueue.main.async {
            self.ai.dismiss(afterDelay: 0.0)
        }
    }
    
    private func refreshFeedsData() {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        self.viewModel.getVideosList()
    }
}

extension EPICAIFeedController: UpdateCommentCountDelegate {
    func updateFeedCommentCount(indexPath: IndexPath?) {
        if let indexPath = indexPath {
            var item = self.items[indexPath.row]
            let cell = self.feedsTableView.cellForRow(at: indexPath) as? FeedsCell
            item.video.commentsCount += 1
            cell?.item = item
            DispatchQueue.main.async {
                self.feedsTableView.reloadData()
                //self.feedsTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
}

extension EPICAIFeedController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return 225.0
        default:
            return 400.0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return 1
        default:
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            guard let _ = cell as? FeedsEmptyCell else { return }
        default:
            guard let cell = cell as? FeedsCell else { return }
            
            cell.lastPagerViewIndex = lastPagerViewIndices[indexPath.row]
            cell.item = items[indexPath.row]
            
            cell.selectedUserDetails = { user in
                self.moveToUserDetails(user: user)
            }
            
            cell.likePost = { item, cellIndexPath  in
                
                self.showLoader()
                //if self.viewModel.requestOnProgress { return }
                
                if item.video.likeStatus == 1 {
                    if let indexPathRecived = cellIndexPath {
                        self.viewModel.updateLikeCount(videoItem: item,indexPath: indexPathRecived, likeState: true) { rrIndexPath in
                            if let rIndexPath = rrIndexPath {
                                self.items[rIndexPath.row].video.likeCount -= 1
                                self.items[rIndexPath.row].video.likeStatus = 0
                                tableView.reloadRows(at: [rIndexPath], with: .automatic)
                                self.hideLoader()
                            }
                            else {
                                self.hideLoader()
                            }
                        }
                    }
                    else {
                        self.hideLoader()
                    }
                }
                else {
                    if let indexPathRecived = cellIndexPath {
                        self.viewModel.updateLikeCount(videoItem: item,indexPath: indexPathRecived, likeState: false) { rrIndexPath in
                            if let rIndexPath = rrIndexPath {
                                self.items[rIndexPath.row].video.likeCount += 1
                                self.items[rIndexPath.row].video.likeStatus = 1
                                tableView.reloadRows(at: [rIndexPath], with: .automatic)
                                self.hideLoader()
                            }
                            else {
                                self.hideLoader()
                            }
                        }
                    }
                    else {
                        self.hideLoader()
                    }
                }
            }
            cell.displayAllCommnets = { (item, cellIndexPath) in
                let controller = EPICAICommentsVC.instantiateFromAppStoryBoard(appStoryBoard: .Comment)
                controller.feedItem = item
                controller.indexPath = cellIndexPath
                controller.delegate = self
                self.navigationController?.pushViewController(controller, animated: true)
            }
            cell.reportInappropriateContent = { item in print("cell.reportInappropriateContent action \(String(describing: item.user.firstName))") }
        }
    }
    
    func moveToUserDetails(user:EPICAIUser) {
        if user.uuid != EPICAISharedPreference.userSession?.uuid {
            let profileVC = EPICAIProfileVC.instantiateFromAppStoryBoard(appStoryBoard: .Main)
            profileVC.userDetails = user
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
        else {
            if let tb = tabBarController as? GenericTabBarController {
                tb.floatingTabbarView.changeTab(toIndex: 2)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedsEmptyCell", for: indexPath) as? FeedsEmptyCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedsCell", for: indexPath) as? FeedsCell else { return UITableViewCell() }
            cell.delegate = self
            cell.item = items[indexPath.row]
            cell.gaugeData = randomGaugeData
            cell.pieChartData = randomPieChartData
            cell.tonalityData = randomTonalityData
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension EPICAIFeedController: FeedsCellDelegate {
    func feedsCell(_ cell: FeedsCell, pagerView: FSPagerView, pageControl: FSPageControl, didGoToPageWithIndex index: Int) {
        guard let indexPath = feedsTableView.indexPath(for: cell) else { return }
        lastPagerViewIndices[indexPath.row] = index
    }
}


