//
//  SceneDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import UIKit
import JGProgressHUD

class EPICAIProfileVC: UIViewController {

    var profileViewModel: EPICAIProfileVM!

    let itemsMargin: CGFloat = 20.0
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "settings"), for: .normal)
        button.addTarget(self, action: #selector(settingsButtonTapped(_:)), for: .touchUpInside)
        return button
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
        
        return table
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
        initializeViewModel()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        if let tbar = tabBarController as? GenericTabBarController{
            tbar.floatingTabbarView.toggle(hide: false)
        }
    }

    func initializeViewModel() {
        profileViewModel = EPICAIProfileVM()
        
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
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        
        profileViewModel.onReceiveVideosURLs = { itemsWithURL in
            if let itemsWithURL = itemsWithURL {
                DispatchQueue.main.async {
                    self.items = itemsWithURL.sorted(by: { $0.videoDate! > $1.videoDate! })
                    self.profileTableView.reloadData()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
            
        }
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
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

        view.backgroundColor = Palette.V2.V2_VCBackground
        
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        view.addSubview(profileTableView)
        view.addSubview(ai)

        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(itemsMargin+5)
            make.top.equalTo(view.snp.topMargin).offset(itemsMargin-20)
            make.height.equalTo(44)
        }
        
        settingsButton.snp.makeConstraints { (make) in
            make.width.equalTo(25.0)
            make.height.equalTo(25.0)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        profileTableView.snp.makeConstraints { (make) in
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
    
    @objc func updateUserInfo(_ notification: Notification) {
        profileViewModel.getUserInfo()
    }
    
    @objc func shouldRefreshFeedsTable(_ notification: Notification) {
        refreshFeedsData()
    }
    
    
    private func refreshFeedsData() {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        self.profileViewModel.getVideosList()
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
            return 130.0
        case 1:
            return 260.0
        case 3:
            return 200.0
        default:
            return 290.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUserInfoCell", for: indexPath) as? ProfileUserInfoCell else { return UITableViewCell() }
            
            cell.profileImage = userItem?.userImage
            cell.name = (userItem?.user.firstName ?? "") + " " + (userItem?.user.lastName ?? "")
            cell.detail = "Subscriptions"
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileOverviewCell", for: indexPath) as? ProfileOverviewCell else { return UITableViewCell() }
            
            cell.data = [1, 9, 9, 7, 9, 9, 9, 8]
            cell.score = CGFloat(CGFloat(cell.data.sum()) / CGFloat(cell.data.count))
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileVideosCell", for: indexPath) as? ProfileVideosCell else { return UITableViewCell() }
            
            cell.delegate = self
            cell.item = items[indexPath.row]
            
            return cell
         
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedsEmptyCell", for: indexPath) as? FeedsEmptyCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            let toVC = EPICAIVideoDetailsVC()
            toVC.videoItem = items[indexPath.row]
            navigationController?.pushViewController(toVC, animated: true)
        default:
            break
        }
        
    }
    
}

extension EPICAIProfileVC: ProfileVideosCellDelegate {
    func profileVideoCell(_ cell: ProfileVideosCell, didAskToShareVideoWithUUID videoUUID: String?) {
        
    }
    
    
}
