//
//  EPICGenericLinkCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit

class EPICGenericLinkCell: UITableViewCell {
    
    private var dividerView: UIView!
    private var titleLabel: UILabel!
    private var detailLabel: UILabel!
    private var arrowImageView: UIImageView!
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var detail: String? = nil {
        didSet {
            detailLabel.text = detail
        }
    }
    
    var isArrowHidden: Bool = false {
        didSet {
            arrowImageView.isHidden = isArrowHidden
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
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = LatoFont.regular.withSize(17.0)
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        contentView.addSubview(titleLabel)
        
        detailLabel = UILabel(frame: .zero)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = LatoFont.regular.withSize(17.0)
        detailLabel.textColor = Palette.V2.V2_settingsGenericCellDetail
        detailLabel.textAlignment = .right
        detailLabel.numberOfLines = 1
        contentView.addSubview(detailLabel)
        
        arrowImageView = UIImageView(frame: .zero)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.tintColor = Palette.V2.V2_settingsGenericCellArrow
        let img = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .thin))
        arrowImageView.image = img
        arrowImageView.contentMode = .scaleAspectFit
        contentView.addSubview(arrowImageView)
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(25.0)
            make.trailing.equalTo(contentView).offset(-25.0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(dividerView.snp.leading).offset(20.0)
            make.centerY.equalTo(contentView).offset(10.0)
            make.width.equalTo(contentView.bounds.width / 2.0)
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.width.equalTo(20.0)
            make.height.equalTo(20.0)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(dividerView.snp.trailing).offset(-20.0)
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(arrowImageView.snp.leading).offset(-0.0)
        }
    }
    
}


