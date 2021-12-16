//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit

class TabBarViewController: GenericTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tabBar.invalidateIntrinsicContentSize()
    }
    
}
