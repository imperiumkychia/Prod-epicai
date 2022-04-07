//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import SnapKit
import UIKit
import SQLite

class ProfileUserInfoCell: UITableViewCell {
    
    private var profileImageViewContainer: UIView!
    private var profileImageView: UIImageView!
    private var nameLabel: UILabel!
    private var detailLabel: UILabel!
    private var dividerView: UIView!
    
    private var followingBtn: UIButton!
    private var followerBtn: UIButton!
    private var subscriptionBtn: UIButton!
    
    var moveToUserList:((Bool) -> Void)?
    var updateFollowStatus:((Bool) -> Void)?
    
    var userDetails:EPICAIUser? {
        didSet {
            guard let details = self.userDetails else { return }
            if let myProfile = EPICAISharedPreference.userSession?.uuid, myProfile != details.uuid {
                self.subscriptionBtn.isHidden = false
            }
            else {
                self.subscriptionBtn.isHidden = true
            }
            self.nameLabel.text = details.firstName + " " + details.lastName
            self.followerBtn.setTitle("Followers (\(details.followerCount))", for: .normal)
            self.followingBtn.setTitle("Following (\(details.followCount))", for: .normal)
            
            if details.followStatus {
                self.subscriptionBtn.setTitle("Unfollow", for: .normal)
            }
            else {
                self.subscriptionBtn.setTitle("Follow", for: .normal)
            }
            
            AWSManager.shared().downloadProfileImage(key: details.imageUrl) { imageURL in
                if let imageURL = imageURL {
                    do {
                        let data = try Data(contentsOf: imageURL)
                        DispatchQueue.main.async { self.profileImageView.image = UIImage(data: data) }
                       
                    } catch {
                        DispatchQueue.main.async { self.profileImageView.image = #imageLiteral(resourceName: "noProfileImage") }
                    }
                }
            }
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
        followerBtn.setTitle("Followers (0)", for: .normal)
        followerBtn.contentHorizontalAlignment  = .left
        followerBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        followerBtn.setTitleColor(Palette.darkPurple, for: .normal)
        followerBtn.addTarget(self, action: #selector(moveToFollowers(_ :)), for: .touchUpInside)
        contentView.addSubview(followerBtn)
        
        followingBtn = UIButton(frame: .zero)
        followingBtn.translatesAutoresizingMaskIntoConstraints = false
        followingBtn.setTitle("Following (0)", for: .normal)
        followingBtn.contentHorizontalAlignment  = .left
        followingBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        followingBtn.setTitleColor(Palette.darkPurple, for: .normal)
        followingBtn.addTarget(self, action: #selector(moveToFollowings(_ :)), for: .touchUpInside)
        contentView.addSubview(followingBtn)
        
        subscriptionBtn = UIButton(frame: .zero)
        subscriptionBtn.translatesAutoresizingMaskIntoConstraints = false
        subscriptionBtn.setTitle("Follow", for: .normal)
        subscriptionBtn.contentHorizontalAlignment  = .center
        subscriptionBtn.titleLabel?.font = LatoFont.bold.withSize(13)
        subscriptionBtn.setTitleColor(.white, for: .normal)
        subscriptionBtn.layer.cornerCurve = .continuous
        subscriptionBtn.layer.cornerRadius = 5
        subscriptionBtn.backgroundColor = Palette.darkPurple
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
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        self.subscriptionBtn.isHidden = true
    }
    
    @objc func moveToFollowers(_ sender:UIButton) {
        guard let moveToUsers = self.moveToUserList else { return }
        moveToUsers(false)
    }
    
    @objc func moveToFollowings(_ sender:UIButton) {
        guard let moveToUsers = self.moveToUserList else { return }
        moveToUsers(true)
    }
    
    @objc func moveToSubscription(_ sender:UIButton) {
        guard let updateFollowStatus = self.updateFollowStatus else { return }
        updateFollowStatus(self.userDetails?.followStatus ?? false)
    }
}
