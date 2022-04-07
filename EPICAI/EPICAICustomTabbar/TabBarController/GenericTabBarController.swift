//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import SnapKit

class GenericTabBarController: UITabBarController {

    let floatingTabbarView = FloatingBarView(images: ["feeds", "camera", "profile"],
                                             titles: ["Feeds", "Camera", "Profile"])

    var floatingTabbarViewIsHidden: Bool {
        return floatingTabbarView.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        setupFloatingTabBar()
    }

    private func createNavViewController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {

        viewController.navigationItem.title = title

        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)

        return navController
    }

    func setupFloatingTabBar() {
        floatingTabbarView.delegate = self
        view.addSubview(floatingTabbarView)
        
        floatingTabbarView.centerXInSuperview()
        floatingTabbarView.snp.makeConstraints { (make) in
            make.height.equalTo(54.0)
            make.leading.equalTo(view).offset(50.0)
            make.trailing.equalTo(view).offset(-50.0)
            make.bottom.equalTo(view).offset(-20.0)
        }
    }
    
    func toggle(hide: Bool) {
        floatingTabbarView.toggle(hide: hide)
    }
    
    func hideFloatingTabBar(_ status: Bool) {
        floatingTabbarView.isHidden = status
    }
}

extension GenericTabBarController: FloatingBarViewDelegate {
    func did(selectindex: Int) {
        selectedIndex = selectindex
        NotificationCenter.default.post(name: .didChageTabCalled, object: nil)
    }
}
