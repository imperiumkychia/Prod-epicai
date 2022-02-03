//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/01/22.
//


import UIKit

class EPICAISubscriptionsVC: UIViewController {

    let itemsMargin: CGFloat = 20.0
    private let profileImageWidth: CGFloat = 100.0

    let subscriptions: [SubscriptionTier] = [(title: "Tier 1", description: "$50/Month with 100 Minutes Analysis"),
                                             (title: "Tier 2", description: "$75/Month with 200 Minutes Analysis"),
                                             (title: "Tier 3", description: "$100/Month with 500 Minutes Analysis")]
    
    var userTierIndex: Int = 1
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    lazy var subscriptionsTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(SubscriptionsCell.self, forCellReuseIdentifier: "SubscriptionsCell")
        table.separatorStyle = .none
        table.backgroundColor = self.view.backgroundColor
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.allowsSelection = true
        table.allowsMultipleSelection = false
        return table
    }()
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        self.leftMenuItems()
        self.applyCustomAppearance()
        self.title = "Subscription"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(subscriptionsTableView)
        
        subscriptionsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(0).offset(itemsMargin * 2.0)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}


extension EPICAISubscriptionsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubscriptionsCell", for: indexPath) as? SubscriptionsCell else { return UITableViewCell() }
        
        cell.tierTitle = subscriptions[indexPath.row].title
        cell.tierDescription = subscriptions[indexPath.row].description
        cell.hasCheckmark = indexPath.row == userTierIndex ? true : false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for c in tableView.visibleCells {
            if let cell = c as? SubscriptionsCell, let idx = tableView.indexPath(for: c) {
                cell.hasCheckmark = idx.row == indexPath.row ? true : false
            }
        }
    }
}


public typealias SubscriptionTier = (title: String, description: String)
