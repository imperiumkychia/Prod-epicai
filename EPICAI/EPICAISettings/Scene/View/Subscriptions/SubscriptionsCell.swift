//
//  SubscriptionsCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import SnapKit

class SubscriptionsCell: UITableViewCell {

    private var dividerView: UIView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var checkmarkImageView: UIImageView!
    
    var tierTitle: String? = nil {
        didSet {
            titleLabel.text = tierTitle
        }
    }
    
    var tierDescription: String? = nil {
        didSet {
            descriptionLabel.text = tierDescription
        }
    }
    
    var hasCheckmark: Bool = false {
        didSet {
            checkmarkImageView.isHidden = !hasCheckmark
        }
    }
    
    private var itemsMargin: CGFloat = 20.0
    
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
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .left
        titleLabel.font = LatoFont.regular.withSize(17.0)
        titleLabel.textColor = Palette.V2.V2_VCTitle
        contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = LatoFont.regular.withSize(15.0)
        descriptionLabel.textColor = Palette.V2.V2_settingsGenericCellDetail
        contentView.addSubview(descriptionLabel)
        
        checkmarkImageView = UIImageView(frame: .zero)
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .regular))
        checkmarkImageView.image = image
        checkmarkImageView.tintColor = .link
        contentView.addSubview(checkmarkImageView)
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
        }
        
        checkmarkImageView.snp.makeConstraints { (make) in
            make.width.equalTo(20.0)
            make.height.equalTo(20.0)
            make.centerY.equalTo(contentView)
            make.trailing.equalTo(dividerView.snp.trailing).offset(-itemsMargin)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.leading.equalTo(dividerView).offset(itemsMargin)
            make.trailing.equalTo(checkmarkImageView.snp.leading).offset(-itemsMargin)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(checkmarkImageView.snp.leading).offset(-itemsMargin)
        }
        
    }
}
