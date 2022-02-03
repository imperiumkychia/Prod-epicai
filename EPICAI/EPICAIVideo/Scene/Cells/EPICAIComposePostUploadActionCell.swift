//
//  CreatePostActionCell.swift
//  Daam
//
//  Created by Abdul on 29/08/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

class EPICAIComposePostUploadActionCell: UITableViewCell {

    static var identifier = "EPICAIComposePostUploadActionCell"
    
    var uploadAcknowledgement:(() -> Void ) = {  }

    @IBOutlet weak var postBtn: CustomUIButton!
    
    @IBAction func uploadVideoData(_ sender:UIButton) {
        uploadAcknowledgement()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if postBtn != nil {
            postBtn.titleLabel?.textColor = Palette.V2.V2_VCTitle
            postBtn.titleLabel?.font = LatoFont.bold.withSize(17)
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
