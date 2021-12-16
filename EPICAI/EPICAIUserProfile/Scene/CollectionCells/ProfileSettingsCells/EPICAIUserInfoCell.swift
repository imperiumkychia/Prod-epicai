//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import SnapKit

protocol SettingsUserInfoCellDelegate: AnyObject {
    func didAskToEditProfileInfo(_ cell: EPICAIUserInfoCell)
}

class EPICAIUserInfoCell: UITableViewCell {
    
    private var profileImageViewContainer: UIView!
    private var profileImageView: UIImageView!
    private var nameLabel: UILabel!
    private var detailLabel: UILabel!
    private var dividerView: UIView!
    private var editButton: UIButton!
    
    weak var delegate: SettingsUserInfoCellDelegate?
    
    var detail: String? {
        didSet {
            detailLabel.text = detail
        }
    }
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var profileImage: UIImage? {
        didSet {
            profileImageView.image = profileImage
        }
    }
    
    private let profileImageWidth: CGFloat = 70.0
    
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
        
        profileImageViewContainer = UIView(frame: .zero)
        profileImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        profileImageViewContainer.layer.cornerRadius = profileImageWidth / 2.0
        profileImageViewContainer.layer.borderWidth = 1.0
        profileImageViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        profileImageViewContainer.clipsToBounds = true
        contentView.addSubview(profileImageViewContainer)
        
        profileImageView = UIImageView(frame: .zero)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = #imageLiteral(resourceName: "profile_unselected")
        profileImageViewContainer.addSubview(profileImageView)
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = LatoFont.bold.withSize(18.0)
        nameLabel.textColor = Palette.V2.V2_VCTitle
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
        detailLabel = UILabel(frame: .zero)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = LatoFont.bold.withSize(13.0)
        detailLabel.textColor = Palette.V2.V2_VCTitle
        detailLabel.textAlignment = .left
        detailLabel.numberOfLines = 0
        contentView.addSubview(detailLabel)
        
        editButton = UIButton(frame: .zero)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.tintColor = Palette.V2.V2_linkBlue
        let img = UIImage(systemName: "square.and.pencil", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30.0, weight: .thin))
        editButton.setImage(img, for: .normal)
        editButton.addTarget(self, action: #selector(didTapOnEditButton(_:)), for: .touchUpInside)
        contentView.addSubview(editButton)
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        profileImageViewContainer.snp.makeConstraints { (make) in
            make.width.equalTo(profileImageWidth)
            make.height.equalTo(profileImageWidth)
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(profileImageViewContainer)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.leading.equalTo(profileImageViewContainer.snp.trailing).offset(15.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
        }
        
        editButton.snp.makeConstraints { (make) in
            make.width.equalTo(20.0)
            make.height.equalTo(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
            make.bottom.equalTo(dividerView.snp.top).offset(-10.0)
        }
    }
    
    @objc private func didTapOnEditButton(_ sender: UIButton) {
        delegate?.didAskToEditProfileInfo(self)
    }
}

