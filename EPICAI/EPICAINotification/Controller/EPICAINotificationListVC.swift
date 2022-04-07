//
//  EPICAINotificationListVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/02/22.
//

import UIKit
import JGProgressHUD

class EPICAINotificationListVC: UIViewController {
    
    @IBOutlet weak var notificationTV:UITableView!
    
    var notificationVM = EPICAINotificationVM()
    
    var progressView:JGProgressHUD  = {
        let hud = JGProgressHUD(style: .light)
        hud.detailTextLabel.text = "Please wait..."
        hud.interactionType = .blockAllTouches
        return hud
    }()
    
    var refreshControl : UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(refreshRecords), for: .valueChanged)
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
    
    lazy var saveButton: UIButton = {
        let button =  UIButton(frame: CGRect(x: 30, y: 5, width: 100, height: 30))
        button.setTitle("Read all", for: .normal)
        button.addTarget(self, action: #selector(readAllButtonTapped(_:)), for: .touchUpInside)
        button.setTitleColor(Palette.V2.V2_VCTitle, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = LatoFont.bold.withSize(14.0)
        return button
    }()
    
    @objc private func backButtonTapped(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    private func rightMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 150, y: 1, width: 130, height: 49))
        rightOptionView.addSubview(self.saveButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.rightBarButtonItem = rightBaritem
    }
    
    @objc private func readAllButtonTapped(_ sender:UIButton) {
        self.showProgressView()
        self.notificationVM.markReadAllNotifications { state in
            if (state) {
                self.notificationVM.notifyListUpdate = { [weak self] _ in
                    self?.notificationTV.reloadData()
                }
            }
            self.hideProgressView()
        }
    }
    
    @objc private func refreshRecords() {
        self.notificationVM.notificationItems = []
        self.notificationTV.reloadData()
        self.fetchRecords()
    }
    
    private func fetchRecords() {
        self.notificationVM.getNotification()
        self.showProgressView()
        self.notificationVM.notifyListUpdate = { _ in
            self.refreshControl.endRefreshing()
            self.notificationTV.reloadData()
            self.hideProgressView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyCustomAppearance()
        self.leftMenuItems()
        self.rightMenuItems()
        self.title = "Notifications"
        self.notificationTV.refreshControl = self.refreshControl
        self.fetchRecords()
    }
    
    private func showProgressView() {
        DispatchQueue.main.async {
            self.progressView.show(in: self.view)
        }
    }
    
    private func hideProgressView() {
        DispatchQueue.main.async {
            self.progressView.dismiss(animated: true)
        }
    }
}

extension EPICAINotificationListVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationVM.notificationItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EPICAINotificationListCellView.identifier) as! EPICAINotificationListCellView
        if self.notificationVM.notificationItems[indexPath.row].status {
            cell.backgroundView = nil;
            cell.backgroundColor = ((traitCollection.userInterfaceStyle) == .dark) ? UIColor.init(white: 0.05, alpha: 1) : UIColor.init(white: 0.95, alpha: 1)
        }
        else {
            cell.backgroundColor = ((traitCollection.userInterfaceStyle) == .dark) ? UIColor.init(white: 0.0, alpha: 1) : UIColor.init(white: 1, alpha: 1)
        }
        cell.notification = self.notificationVM.notificationItems[indexPath.row]
        cell.markReadNotification = { (item, indexPath) in
            guard let item = item, let indexPath = indexPath else { return }
            self.updateReadStatus(item: item, indexPath: indexPath)
        }
        return cell
    }
    
    private func updateReadStatus(item:EPICAINotification, indexPath:IndexPath) {
        self.showProgressView()
        self.notificationVM.markReadNotification(notification: item) { state in
            if state {
                self.notificationVM.notificationItems[indexPath.row].status = true
                self.notificationTV.reloadRows(at: [indexPath], with: .fade)
            }
            self.hideProgressView()
        }
    }
}
/*
extension EPICAINotificationListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var preDefineHeight:CGFloat = 100
        let message = self.notificationVM.notificationItems[indexPath.row].message
        if message.sizeOfString(font: UIFont.systemFont(ofSize: 15), constrainedToWidth: Double(UIScreen.main.bounds.width-20)).height > 100  {
            preDefineHeight = 100 + message.sizeOfString(font: UIFont.systemFont(ofSize: 15), constrainedToWidth: Double(UIScreen.main.bounds.width-20)).height/13
        }
        return CGSize(width: Double(UIScreen.main.bounds.width-20), height: preDefineHeight).height
    }
}
 */
