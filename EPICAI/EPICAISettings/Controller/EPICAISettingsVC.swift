//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import WebKit

class EPICAISettingsVC: UIViewController {
    
    lazy var settingsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(EPICAIUserInfoCell.self, forCellReuseIdentifier: "SettingsUserInfoCell")
        table.register(EPICGenericLinkCell.self, forCellReuseIdentifier: "SettingsGenericLinkCell")
        table.register(EPICAIGenericSwitchCell.self, forCellReuseIdentifier: "SettingsGenericSwitchCell")
        table.register(EPICAISignOutCell.self, forCellReuseIdentifier: "SettingsSignOutCell")
        table.register(EPICAISettingsEmptyCell.self, forCellReuseIdentifier: "SettingsGenericEmptyCell")

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
    
    var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
    }
    private func leftMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        rightOptionView.addSubview(self.backButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.leftBarButtonItem = rightBaritem
    }
    
    var profileViewModel: EPICAIProfileVM!
    var userItem: EPICAIUserAccountItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(userDidSignOut(_:)), name: .userDidSignOut, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserInfo(_:)), name: .userInfoUpdated, object: nil)
        
        setupUIElements()
        initializeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Settings"
        self.leftMenuItems()
        //navigationController?.isNavigationBarHidden = true
        
        if let tbar = tabBarController as? GenericTabBarController{
            tbar.floatingTabbarView.toggle(hide: true)
        }
    }

    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(settingsTableView)
        settingsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(10.0)
            make.bottom.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }
    }
    
    func initializeViewModel() {
        profileViewModel = EPICAIProfileVM()
        profileViewModel.onUserInfoChange = { item in
            self.userItem = item
            DispatchQueue.main.async {
                self.settingsTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                self.settingsTableView.reloadRows(at: [IndexPath(row: 1, section: 1)], with: .fade)
            }
        }
        profileViewModel.getUserInfo()
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    @objc func userDidSignOut(_ notification: Notification) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {
            EPICAISharedPreference.userSession = nil
            guard let windowScene = self.view.window?.windowScene else { return }
            let scene = UIApplication.shared.connectedScenes.first
            if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                sd.setRootViewController(windowSceen: windowScene)
            }
        })
    }
    
    @objc func updateUserInfo(_ notification: Notification) {
        profileViewModel.getUserInfo()
    }
}

extension EPICAISettingsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 3
        case 3:
            return 8
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100.0
        default:
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsUserInfoCell", for: indexPath) as? EPICAIUserInfoCell else { return UITableViewCell() }
            cell.delegate = self
            cell.profileImage = userItem?.userImage ?? #imageLiteral(resourceName: "noProfileImage")
            cell.name = (userItem?.user.firstName ?? "") + " " + (userItem?.user.lastName ?? "")
            cell.detail = userItem?.user.email
            return cell
        case 1:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.isArrowHidden = false
                cell.title = "Subscription Tier"
                cell.detail = "Detail"
                return cell
            } else if indexPath.row == 1{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.isArrowHidden = true
                cell.title = "Logged in Account"
                cell.detail = userItem?.user.vendor
                return cell
            }
            else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.isArrowHidden = false
                cell.title = "Advance settings"
                cell.detail = "Detail"
                return cell
            }
        case 2:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericSwitchCell", for: indexPath) as? EPICAIGenericSwitchCell else { return UITableViewCell() }
                cell.title = "Push Notification"
                cell.status = true
                return cell
            } else if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericSwitchCell", for: indexPath) as? EPICAIGenericSwitchCell else { return UITableViewCell() }
                cell.title = "Allow Mobile Data Upload"
                cell.status = true
                return cell
            } else if indexPath.row == 2 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericSwitchCell", for: indexPath) as? EPICAIGenericSwitchCell else { return UITableViewCell() }
                cell.title = "Allow Background Process"
                cell.status = true
                return cell
            } else {
                return UITableViewCell()
            }
        case 3:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "App Tutorial"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            }
            if indexPath.row == 1 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "Feedback"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            } else if indexPath.row == 2 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "FAQ"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            } else if indexPath.row == 3 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "Contact Us"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            } else if indexPath.row == 4 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "Terms and Conditions"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            } else if indexPath.row == 5 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "Privacy Policy"
                cell.detail = ""
                cell.isArrowHidden = false
                return cell
            } else if indexPath.row == 6 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericLinkCell", for: indexPath) as? EPICGenericLinkCell else { return UITableViewCell() }
                cell.title = "Version"
                cell.detail = appVersion ?? "-"
                cell.isArrowHidden = true
                return cell
            } else if indexPath.row == 7 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSignOutCell", for: indexPath) as? EPICAISignOutCell else { return UITableViewCell() }
                return cell
            } else {
                return UITableViewCell()
            }
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsGenericEmptyCell", for: indexPath) as? EPICAISettingsEmptyCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 60.0))
        v.backgroundColor = tableView.backgroundColor
        let l = UILabel(frame: v.frame.inset(by: UIEdgeInsets(top: 25.0, left: 25, bottom: 0, right: 0)))
        l.textAlignment = .left
        l.numberOfLines = 1
        l.textColor = Palette.V2.V2_SettingsTableHeader
        l.font = LatoFont.regular.withSize(19.9)
        v.addSubview(l)
        
        switch section {
        case 2, 3:
            if section == 2 {
                l.text = "Permission"
            } else {
                l.text = "Information"
            }
            return v
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0, 1, 4:
            return 0
        default:
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: break
        case 1:
            if indexPath.row == 0 {
                self.pushSubscriptionViewController()
            }
            if indexPath.row == 2 {
                self.pushToAdvanceSettingsVC()
            }
        case 2: break
            
        case 3:
            if indexPath.row == 0 {
                self.pushTutorialViewController()
                break
            }
            if indexPath.row == 1 {
                self.pushFeedbackViewController()
                break
            }
            if indexPath.row == 2 {
                UIApplication.shared.open(URL(string: "https://airdigital.ai/epic-ai")!,options: [:],completionHandler: nil)
                //self.pushCommonQuestionViewController()
                break
            }
            
            if indexPath.row == 3 {
                //self.pushContactUsViewController()
                UIApplication.shared.open(URL(string: "https://airdigital.ai/contact-us")!,options: [:],completionHandler: nil)
                break
            }
            
            if indexPath.row == 4 {
                //self.pushEndUserAgreementViewController()
                UIApplication.shared.open(URL(string: "https://airdigital.ai/terms-%26-conditions")!,options: [:],completionHandler: nil)
                break
            }
            
            if indexPath.row == 5 {
                UIApplication.shared.open(URL(string: "https://airdigital.ai/privacy-policy")!,options: [:],completionHandler: nil)
                //self.pushPrivacyPolicyViewController()
                break
            }
            
            if indexPath.row == 7 {
                self.signoutFlow()
            }
            
        default: break
        }
    }
    
    func signoutFlow() {
        let alert = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        alert.view.tintColor = Palette.V2.V2_VCTitle
        let titleAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(20.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
        let titleString = NSAttributedString(string: "Sign out", attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        let messageAttributes = [NSAttributedString.Key.font: LatoFont.regular.withSize(17.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle]
        let messageString = NSAttributedString(string: "Are you sure you want to sign out?", attributes: messageAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.setValue(messageString, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: "Yes", style: .default) { _ in
            AuthService.shared().signOut()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = self.view.bounds
        present(alert, animated: true)
        
    }
}

extension EPICAISettingsVC: SettingsUserInfoCellDelegate {
    func didAskToEditProfileInfo(_ cell: EPICAIUserInfoCell) {
        self.pushAccountViewController()
    }
    
    
}
