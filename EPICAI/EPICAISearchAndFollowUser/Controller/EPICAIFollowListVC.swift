//
//  EPICAIFollowListVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 05/02/22.
//

import UIKit
import JGProgressHUD
import CDAlertView

class EPICAIFollowListVC: UIViewController {
    
    @IBOutlet weak var userTableView:UITableView!
    
    var followVM = EPICAISearchUserVM()
    var otherUser:EPICAIUser?
    var follow:Bool = false
    
    var ai:JGProgressHUD  = {
        let hud = JGProgressHUD(style: .light)
        hud.interactionType = .blockAllTouches
        hud.detailTextLabel.text = "Please wait..."
        return hud
    }()
    
    var refreshControll:UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return controll
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTableView.refreshControl = self.refreshControll
        self.leftMenuItems()
        self.applyCustomAppearance()
        self.title = (self.follow) ? "Following" : "Followers"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchUsers()
    }
    
    private func displayProgressHUD() {
        DispatchQueue.main.async {
            self.ai.show(in: self.view)
        }
    }
    
    private func hideProgressHUD() {
        DispatchQueue.main.async {
            self.ai.dismiss(animated: true)
        }
    }
    private func fetchUsers() {
        self.displayProgressHUD()
        if let otherUser = self.otherUser { self.followVM.getUsers(isFollow:follow, otherUser: otherUser) }
        else { self.followVM.getUsers(isFollow:follow, otherUser:nil)}
        self.followVM.notifyUserListUpdated = { _ in
            self.refreshControll.endRefreshing()
            self.userTableView.reloadData()
            self.hideProgressHUD()
        }
    }
    
    @objc private func backButtonTapped(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func refreshData() {
        self.fetchUsers()
    }
}

extension EPICAIFollowListVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followVM.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EPICAISearchUserTableCell.identifier) as! EPICAISearchUserTableCell
        cell.userDetails = self.followVM.users[indexPath.row]
        cell.otherUser = self.otherUser
        cell.isFollow = self.follow
        cell.performFollowAction = { state in
            if !state && self.follow {
                self.showAlertWithOption(state: state, user: self.followVM.users[indexPath.row], indexPath: indexPath)
            }
        }
        return cell
    }
    
    private func showAlertWithOption(state:Bool, user:EPICAIUser, indexPath:IndexPath) {
        
        let alert = CDAlertView(title: "EPICAI Alert!", message: "You are going to unfollow \(user.firstName) \(user.lastName)", type: .alarm)
        let doneAction = CDAlertViewAction(title: "Yes", font: nil, textColor: nil, backgroundColor: nil) { (_) -> Bool in
            //self.dismiss(animated: true, completion: nil)
            self.updateState(state: state, user: user, indexPath: indexPath)
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
    
    private func updateState(state:Bool, user:EPICAIUser, indexPath:IndexPath) {
        self.displayProgressHUD()
        self.followVM.performFollow(state: state, selectedUser:  self.followVM.users[indexPath.row]) { resultStatues in
            if resultStatues {
                self.followVM.users.remove(at: indexPath.row)
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
                self.hideProgressHUD()
            }
        }
    }
}

extension EPICAIFollowListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if self.otherUser == nil {
            self.routeToUserProfile(user: self.followVM.users[indexPath.row])
        //}
    }
    
    func routeToUserProfile(user:EPICAIUser) {
        let profileVC = EPICAIProfileVC.instantiateFromAppStoryBoard(appStoryBoard: .Main)
        profileVC.otherUserDetails = user
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}

