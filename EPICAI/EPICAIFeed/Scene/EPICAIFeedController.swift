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
    
//    lazy var backButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
//        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
//        button.setImage(image, for: .normal)
//        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
//        button.tintColor = Palette.V2.V2_VCTitle
//        return button
//    }()
    
    lazy var searchButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 60, y: 10, width: 30, height: 30))
        let img = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .semibold))
        button.setImage(img, for: .normal)
        button.addTarget(self, action: #selector(moveToSeachUsers(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    lazy var notificationButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 10, width: 30, height: 30))
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
    
    lazy var badgelbl:UILabel = {
        let badgelbl = UILabel(frame: CGRect(x: 115, y: -1, width: 25, height: 25))
        badgelbl.clipsToBounds = true
        badgelbl.layer.cornerCurve = .continuous
        badgelbl.layer.cornerRadius = 15
        badgelbl.textColor = .white
        badgelbl.backgroundColor = .red
        badgelbl.text = "0"
        badgelbl.textAlignment = .center
        badgelbl.font = LatoFont.bold.withSize(9)
        return badgelbl
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
    
    //let randomGaugeData = RandomDataGenerator.generateRandomGaugeData()
    //let randomPieChartData = RandomDataGenerator.generateRandomPieChartData(numberOfCategories: 4)
    //let randomTonalityData = RandomDataGenerator.generateRandomTonalityData()
    
    var refreshControl: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(initiateVideoModel), for: .valueChanged)
        return controll
    }()
    
    @objc func moveToSeachUsers(_ sender:UIBarButtonItem) {
        let viewController = EPICAISearchUserVC.instantiateFromAppStoryBoard(appStoryBoard: .UsersStoryboard)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func moveToNotification(_ sender:UIButton) {
        let controller = EPICAINotificationListVC.instantiateFromAppStoryBoard(appStoryBoard: .NotificationSB)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feeds"
        self.applyCustomAppearance()
        self.rightMenuItems()
        self.leftMenuItems()
        setupUIElements()
        initiateVideoModel()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(shouldMoveToRoot(_:)),
                                               name: .didChageTabCalled,
                                               object: nil)
    }
    
    @objc func shouldMoveToRoot(_ notification: Notification) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    private func rightMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 50, y: 1, width: 130, height: 49))
        rightOptionView.addSubview(searchButton)
        rightOptionView.addSubview(notificationButton)
        rightOptionView.addSubview(badgelbl)
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
            return 420.0
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
            cell.reportInappropriateContent = { item, indexPath in
                self.reportContent(item: item, indexPath: indexPath)
            }
        }
    }
    
    private func reportContent(item:EPICAIFeedItem, indexPath:IndexPath?) {
        guard let indexPath = indexPath else { return }
        let controller = EPICAINotePopUpVC.instantiateFromAppStoryBoard(appStoryBoard: .Comment)
        controller.indexPath = indexPath
        controller.isReport = true
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
    }
    
    private func moveToUserDetails(user:EPICAIUser) {
        if user.uuid != EPICAISharedPreference.userSession?.uuid {
            let profileVC = EPICAIProfileVC.instantiateFromAppStoryBoard(appStoryBoard: .Main)
            profileVC.otherUserDetails = user
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
            //print("[DEBUG] EPICAIFeedController : \(cell.item?.fillerWords)")
            //print("[DEBUG] EPICAIFeedController : \(RandomDataGenerator.generateRandomTonalityData())")
            
            // OLD CODE - RANDOMIZED DATA FOR CHARTS
            //cell.gaugeData = randomGaugeData
            //cell.pieChartData = randomPieChartData
            //cell.tonalityData = randomTonalityData
            
            //CREATED BY CHIA KANG YEE: 5th APRIL 2022
            //Display feed result with real data
            //Speed of speech
            cell.gaugeData = cell.item?.speedOfSpeech?.score ?? 0//RandomDataGenerator.generateRandomGaugeData()
            //Body Language
            var loopCount = 0;
            var barCategoryList = [LegendCategory]()
            for blResult in cell.item?.bodyLaguageResult ?? []{
                let blResultAssign:LegendCategory =
                    (title: blResult.type,
                    color: Palette.barColor[loopCount],
                    percentage: blResult.score)
                barCategoryList.append(blResultAssign)
                loopCount+=1
            }
            cell.pieChartData = barCategoryList
            //Tonality
            //Assign array
            cell.tonalityData = cell.item?.tonalityResult?.results ?? []
            //Pass parameter for min, max and average decibel
            cell.minDcbl = cell.item?.tonalityResult?.minDecibel ?? 0
            cell.maxDcbl = cell.item?.tonalityResult?.maxDecibel ?? 0
            cell.avgDcbl = cell.item?.tonalityResult?.averageDecibel ?? 0
            //filler word
            var fillerWordTypeVar = FillerWordType(title: "Um", color: Palette.V2.V2_fillerWordsGrey, value: 10)
            cell.fillerword = []
            loopCount = 0;
            for fw in cell.item?.fillerWords ?? [] {
                fillerWordTypeVar.title = fw.type
                fillerWordTypeVar.color = Palette.barColor[loopCount]
                fillerWordTypeVar.value = Int(fw.score)
                cell.fillerword.append(fillerWordTypeVar)
                loopCount+=1
            }
            
            
            // OLD CODE - RANDOMIZED DATA FOR CHARTS
            //cell.gaugeData = RandomDataGenerator.generateRandomGaugeData()
            //cell.pieChartData = RandomDataGenerator.generateRandomPieChartData(numberOfCategories: 4)
            //cell.tonalityData = RandomDataGenerator.generateRandomTonalityData()
            
            
            return cell
        }
    }
    
}

extension EPICAIFeedController: FeedsCellDelegate {
    func feedsCell(_ cell: FeedsCell, pagerView: FSPagerView, pageControl: FSPageControl, didGoToPageWithIndex index: Int) {
        guard let indexPath = feedsTableView.indexPath(for: cell) else { return }
        lastPagerViewIndices[indexPath.row] = index
    }
}

extension EPICAIFeedController : EPICAINotePopUpProtocol {
    
    private func displaySuccessAlert() {
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: (self.traitCollection.userInterfaceStyle == .light) ? .light : .dark)
            hud.show(in: self.view, animated: true)
            hud.indicatorView = JGProgressHUDSuccessIndicatorView()
            hud.textLabel.text = "Success"
            hud.square = true
            hud.dismiss(afterDelay: 3)
        }
    }
    
    func addReplyOnCommnet(indexPath: IndexPath, message: String,isReport:Bool) {
        let feedItem = self.items[indexPath.row]
        self.showLoader()
        self.viewModel.reportVideo(epicFeedItem: feedItem, comment: message) { state in
            if state {
                self.hideLoader()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.displaySuccessAlert()
                }
            }
            else {
                self.hideLoader()
            }
        }
    }
}


