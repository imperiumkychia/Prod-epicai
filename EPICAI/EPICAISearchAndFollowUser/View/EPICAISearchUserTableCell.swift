//
//  EPICAISearchUserTableCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 04/02/22.
//

import UIKit

class EPICAISearchUserTableCell: UITableViewCell {
    
    static var identifier = "EPICAISearchUserTableCell"
    
    @IBOutlet weak var userImgView:UIImageView!
    @IBOutlet weak var userNameLbl:UILabel!
    @IBOutlet weak var followBtn:UIButton!
    @IBOutlet weak var followStack:UIStackView!
    
    @IBAction func followBtnAction(_ sender : UIButton) {
        guard let action = self.performFollowAction else { return }
        if let followStatus = self.userDetails?.followStatus, followStatus {
            action(false)
        }
        else {
            action(true)
        }
    }
    
    var performFollowAction:((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpUIItems()
    }
    
    private func setUpUIItems() {
        self.userImgView.clipsToBounds = true
        self.userImgView.image = #imageLiteral(resourceName: "noProfileImage")
        self.userImgView.layer.cornerRadius = self.userImgView.frame.height/2
        self.layer.cornerCurve = .circular
        
        userNameLbl.font = LatoFont.bold.withSize(15.0)
        userNameLbl.textColor = Palette.V2.V2_VCTitle
        
        followBtn.setTitleColor(UIColor.white, for: .normal)
        followBtn.backgroundColor = Palette.darkPurple
        followBtn.clipsToBounds = true
        followBtn.layer.cornerRadius = 5
        followBtn.titleLabel?.font = LatoFont.bold.withSize(13.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var isFollow:Bool? {
        didSet {
            guard let isFollow = self.isFollow, !isFollow else { return }
            if self.followStack != nil {
                self.followStack.removeFromSuperview()
            }
            //self.followBtn.isHidden = true
        }
    }
    
    var otherUser:EPICAIUser? {
        didSet {
            guard let othUser = self.otherUser else { return }
            if othUser.uuid != EPICAISharedPreference.userSession?.uuid {
                if self.followStack != nil {
                    self.followStack.removeFromSuperview()
                }
                //self.followBtn.isHidden = true
            }
            else { self.followBtn.isHidden = false }
        }
    }
    
    var userDetails:EPICAIUser? {
        didSet {
            guard let details = self.userDetails else { return }
            AWSManager.shared().downloadProfileImage(key: details.imageUrl) { imageURL in
                if let imageURL = imageURL {
                    do {
                        let data = try Data(contentsOf: imageURL)
                        DispatchQueue.main.async { self.userImgView.image = UIImage(data: data) }
                    } catch {
                        DispatchQueue.main.async { self.userImgView.image = #imageLiteral(resourceName: "noProfileImage") }
                    }
                }
            }
            self.userNameLbl.text = details.firstName + " " + details.lastName
            if self.followBtn != nil {
                self.followBtn.setTitle((details.followStatus) ? "Unfollow" : "Follow", for: .normal)
            }
        }
    }
}
