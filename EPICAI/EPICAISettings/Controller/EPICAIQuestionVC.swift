//
//  CommonQuestionViewController.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 14/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//

import UIKit

class EPICAIQuestionVC: UIViewController {

    let itemsMargin: CGFloat = 20.0

    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    private func leftMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        rightOptionView.addSubview(self.backButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.leftBarButtonItem = rightBaritem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyCustomAppearance()
        self.leftMenuItems()
        self.title = "Common Question"
        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}


