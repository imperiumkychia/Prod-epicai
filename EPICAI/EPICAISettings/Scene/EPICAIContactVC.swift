//
//  ContactUsViewController.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 14/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//


import UIKit

class EPICAIContactVC: UIViewController {

    
    let itemsMargin: CGFloat = 20.0

    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Us"
        label.font = LatoFont.bold.withSize(27.0)
        label.textColor = Palette.V2.V2_VCTitle
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground

        view.addSubview(backButton)
        view.addSubview(titleLabel)
        
        backButton.snp.makeConstraints { (make) in
            make.leading.equalTo(view).offset(itemsMargin)
            make.top.equalTo(view.snp.topMargin).offset(itemsMargin)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(backButton.snp.trailing).offset(itemsMargin)
            make.centerY.equalTo(backButton)
        }
        
        
    }
    
    
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
}



