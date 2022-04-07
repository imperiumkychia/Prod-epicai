//
//  CommentsCCell.swift
//  Daam
//
//  Created by Abdul on 10/10/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

class EPICAICommentCell: UICollectionViewCell {
    
    static var identifier = "EPICAICommentCell"
    
    @IBOutlet weak var seprateView:UIView!
    @IBOutlet weak var profileImgView:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var commentTxt:UILabel!
    @IBOutlet weak var timeAgoLbl:UILabel!
    @IBOutlet weak var replyView:UIView!
    
    @IBOutlet weak var replyImgView: UIImageView!
    @IBOutlet weak var reportImgView: UIImageView!
    
    var performReply:((IndexPath) -> Void)?
    var performReportContent:((IndexPath) -> Void)?
    
    @IBAction func replyBtnClicked(sender:UIButton) {
        self.performReply?(self.indexPath)
    }
    
    @IBAction func reportComment(_ sender: Any) {
        self.performReportContent?(self.indexPath)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    private func setUpView(){
        self.replyImgView.applyTheme(true)
        self.reportImgView.applyTheme(true)
        
        self.backgroundColor = Palette.V2.V2_VCBackground
        self.contentView.backgroundColor = self.backgroundColor
        
        if self.profileImgView != nil {
            self.profileImgView.contentMode = .scaleAspectFill
            self.profileImgView.clipsToBounds = true
            self.profileImgView.layer.masksToBounds = true
            self.profileImgView.layer.cornerRadius = self.profileImgView.frame.size.height/2
        }
        
        if self.titleLbl != nil {
            titleLbl.font = LatoFont.bold.withSize(14.0)
            titleLbl.textColor = Palette.V2.V2_VCTitle
        }
        
        if self.commentTxt != nil {
            commentTxt.font = LatoFont.regular.withSize(13.0)
            commentTxt.textColor = Palette.V2.V2_VCTitle
        }
        
        if self.timeAgoLbl != nil {
            timeAgoLbl.font = LatoFont.regular.withSize(12.0)
            timeAgoLbl.textColor = Palette.V2.V2_feedsDate
        }
    }
    
    var commnet:EPICAICommentItem? {
        didSet {
            self.profileImgView.image = commnet?.userImage ?? #imageLiteral(resourceName: "noProfileImage")
            if let firstName = commnet?.user.firstName, let lastName = commnet?.user.lastName {
                let attributedTxt = NSMutableAttributedString(string: firstName + " " + lastName, attributes: [NSAttributedString.Key.font:LatoFont.bold.withSize(14.0), NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle])
                titleLbl.attributedText = attributedTxt
            }
            if let commentText = commnet?.comment.comment {
                self.commentTxt.text  = commentText
            }
            if let commentCreatedOnText = commnet?.comment.createdOn {
                self.timeAgoLbl.text  = commentCreatedOnText.getDisplayDate()
            }
        }
    }
}
