//
//  SettingsGenericSwitchCell.swift
//  EPICAI
//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit

class EPICAIGenericSwitchCell: UITableViewCell {
    
    private var dividerView: UIView!
    private var titleLabel: UILabel!
    private var toggleSwitch: UISwitch!
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var status: Bool = true {
        didSet {
            toggleSwitch.isOn = status
        }
    }
    
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
        
        toggleSwitch = UISwitch(frame: .zero)
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(toggleSwitch)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = LatoFont.regular.withSize(17.0)
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        contentView.addSubview(titleLabel)
        
        
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(25.0)
            make.trailing.equalTo(contentView).offset(-25.0)
        }
        
        toggleSwitch.snp.makeConstraints { (make) in
            make.trailing.equalTo(dividerView).offset(-20.0)
            make.centerY.equalTo(contentView).offset(10.0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(dividerView.snp.leading).offset(20.0)
            make.centerY.equalTo(toggleSwitch)
            make.trailing.equalTo(toggleSwitch.snp.leading).offset(-20.0)
        }
        
        
    }
    
}



