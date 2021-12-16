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
    
    var viewModel: EPICAIFeedVM!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("User details = \(String(describing: EPICAISharedPreference.userSession))")
        self.title = "Feeds"
        setupUIElements()
        initiateVideoModel()
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
            var item = self.viewModel.items?[indexPath.row]
            let cell = self.feedsTableView.cellForRow(at: indexPath) as? FeedsCell
            item?.video.commentsCount += 1
            cell?.item = item
            self.feedsTableView.reloadRows(at: [indexPath], with: .automatic)
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
            
            cell.likePost = { item  in
                self.viewModel.updateLikeCount(videoItem: item,indexPath: indexPath) { indexPath in
                    if let indexPath = indexPath {
                        self.items[indexPath.row].video.likeCount += 1
                        tableView.reloadRows(at: [indexPath], with: .automatic)
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


