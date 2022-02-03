//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import SnapKit
import UIKit

class ProfileUserInfoCell: UITableViewCell {
    
    private var profileImageViewContainer: UIView!
    private var profileImageView: UIImageView!
    private var nameLabel: UILabel!
    private var detailLabel: UILabel!
    private var dividerView: UIView!
    
    private var followingBtn: UIButton!
    private var followerBtn: UIButton!
    private var subscriptionBtn: UIButton!
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var following: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var profileImage: UIImage? {
        didSet {
            profileImageView.image = profileImage ?? #imageLiteral(resourceName: "noProfileImage")
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
        profileImageView.image = #imageLiteral(resourceName: "noProfileImage")
        profileImageViewContainer.addSubview(profileImageView)
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = LatoFont.bold.withSize(18.0)
        nameLabel.textColor = Palette.V2.V2_VCTitle
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        contentView.addSubview(nameLabel)
        
        followerBtn = UIButton(frame: .zero)
        followerBtn.translatesAutoresizingMaskIntoConstraints = false
        followerBtn.setTitle("Followers 150", for: .normal)
        followerBtn.contentHorizontalAlignment  = .left
        followerBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        followerBtn.setTitleColor(Palette.darkPurple, for: .normal)
        followerBtn.addTarget(self, action: #selector(moveToFollowers(_ :)), for: .touchUpInside)
        contentView.addSubview(followerBtn)
        
        followingBtn = UIButton(frame: .zero)
        followingBtn.translatesAutoresizingMaskIntoConstraints = false
        followingBtn.setTitle("Following 150", for: .normal)
        followingBtn.contentHorizontalAlignment  = .left
        followingBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        followingBtn.setTitleColor(Palette.darkPurple, for: .normal)
        followingBtn.addTarget(self, action: #selector(moveToFollowings(_ :)), for: .touchUpInside)
        contentView.addSubview(followingBtn)
        
        subscriptionBtn = UIButton(frame: .zero)
        subscriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        subscriptionBtn.setTitle("Subscriptions -> Tier 1", for: .normal)
        subscriptionBtn.contentHorizontalAlignment  = .left
        subscriptionBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        subscriptionBtn.setTitleColor(Palette.darkPurple, for: .normal)
        subscriptionBtn.addTarget(self, action: #selector(moveToSubscription(_ :)), for: .touchUpInside)
        contentView.addSubview(subscriptionBtn)
        
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        profileImageViewContainer.snp.makeConstraints { (make) in
            make.width.equalTo(profileImageWidth)
            make.height.equalTo(profileImageWidth)
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(20.0)
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(profileImageViewContainer)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(35)
            make.leading.equalTo(profileImageViewContainer.snp.trailing).offset(15.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        followerBtn.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameLabel)
        }
        
        followingBtn.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.trailing.equalTo(contentView)
        }
        
        subscriptionBtn.snp.makeConstraints { make in
            make.top.equalTo(followerBtn.snp.bottom)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(contentView).offset(-20)
        }
    }
    
    @objc func moveToFollowers(_ sender:UIButton) {
        print("Move to moveToFollowers")
    }
    
    @objc func moveToFollowings(_ sender:UIButton) {
        print("Move to moveToFollowings")
    }
    
    @objc func moveToSubscription(_ sender:UIButton) {
        print("Move to moveToSubscription")
    }
    

}
