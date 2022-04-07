//
//  EPICAISearchUserVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 04/02/22.
//

import UIKit
import JGProgressHUD

class EPICAISearchUserVC: UIViewController {
    
    @IBOutlet weak var searchUserTableView:UITableView!
    @IBOutlet weak var searchBar:UISearchBar!
    
    var searchUserVM = EPICAISearchUserVM()
    
    var ai:JGProgressHUD  = {
        let hud = JGProgressHUD(style: .light)
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
        self.leftMenuItems()
        applyCustomAppearance()
        self.searchBar.searchTextField.font = LatoFont.bold.withSize(15.0)
        self.title = "Search users"
        self.searchUserTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        //searchUserTableView.register(EPICAISearchUserTableCell.self, forCellReuseIdentifier: EPICAISearchUserTableCell.identifier)
        searchUserTableView.refreshControl = self.refreshControll
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @objc private func backButtonTapped(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func refreshData() {
        self.fetchUsers(for: self.searchBar.text ?? "")
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
    
    private func fetchUsers(for text:String) {
        if text.isEmptyString() { return }
        self.displayProgressHUD()
        self.searchUserVM.getUsers(searchString: text)
        self.searchUserVM.notifyUserListUpdated = { _ in
            self.refreshControll.endRefreshing()
            self.searchUserTableView.reloadData()
            self.hideProgressHUD()
        }
    }
}

extension EPICAISearchUserVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchUserVM.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: EPICAISearchUserTableCell.identifier) as! EPICAISearchUserTableCell
        tableCell.userDetails = self.searchUserVM.users[indexPath.row]
        tableCell.performFollowAction = { state in
            self.displayProgressHUD()
            self.searchUserVM.performFollow(state: state, selectedUser: self.searchUserVM.users[indexPath.row]) { responseState in
                if responseState {
                    self.searchUserVM.users[indexPath.row].followStatus = state
                    tableView.reloadRows(at: [indexPath], with: .fade)
                }
                self.hideProgressHUD()
            }
        }
        return tableCell
    }
}

extension EPICAISearchUserVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.routeToUserProfile(user: self.searchUserVM.users[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func routeToUserProfile(user:EPICAIUser) {
        let profileVC = EPICAIProfileVC.instantiateFromAppStoryBoard(appStoryBoard: .Main)
        profileVC.otherUserDetails = user
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}

extension EPICAISearchUserVC : UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchUserVM.users = []
        self.searchUserTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmptyString() { self.fetchUsers(for: text) }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text,  text.isEmpty , text == "" {
            self.searchUserVM.users = []
            self.searchUserTableView.reloadData()
        }
    }
}
