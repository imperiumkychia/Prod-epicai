//
//  SettingsSignOutCell.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 14/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//

import Foundation
import UIKit

class EPICAISignOutCell: UITableViewCell {
    
    private var signOutLabel: UILabel!
    private var dividerView: UIView!

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = Palette.V2.V2_VCBackground
        contentView.backgroundColor = backgroundColor
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        
        signOutLabel = UILabel(frame: .zero)
        signOutLabel.translatesAutoresizingMaskIntoConstraints = false
        signOutLabel.font = LatoFont.regular.withSize(17.0)
        signOutLabel.textColor = .link
        signOutLabel.textAlignment = .left
        signOutLabel.numberOfLines = 1
        signOutLabel.text = "Sign Out"
        contentView.addSubview(signOutLabel)
        
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(25.0)
            make.trailing.equalTo(contentView).offset(-25.0)
        }
        
        signOutLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(dividerView.snp.leading).offset(20.0)
            make.centerY.equalTo(contentView).offset(10.0)
            make.trailing.equalTo(contentView)
        }
        
        
    }
}
