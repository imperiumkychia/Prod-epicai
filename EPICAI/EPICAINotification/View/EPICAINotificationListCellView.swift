//
//  EPICAINotificationListCellView.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/02/22.
//

import UIKit

class EPICAINotificationListCellView: UITableViewCell {
    
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var messageLBl:UILabel!
    @IBOutlet weak var dateTimeLBL:UILabel!
    @IBOutlet weak var markReadBtn:UIButton!
    
    var notification:EPICAINotification? {
        didSet {
            guard let notification = self.notification else { return }
            self.titleLbl.text = notification.title
            self.messageLBl.text = notification.message
            self.dateTimeLBL.text = notification.dateTime.getDisplayDate()
            self.markReadBtn.isHidden = notification.status
        }
    }
    
    var markReadNotification:((EPICAINotification?, IndexPath?) -> Void)?
    
    @IBAction func markRead(_ sender : UIButton) {
        self.markReadNotification?(self.notification, self.indexPath)
    }
    
    static var identifier = "EPICAINotificationListCellView"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.customizeUI()
        // Initialization code
    }
    
    private func customizeUI() {
        self.titleLbl.textColor = Palette.V2.V2_VCTitle
        self.messageLBl.textColor = Palette.V2.V2_VCTitle
        self.dateTimeLBL.textColor = Palette.V2.V2_VCTitle
        
        self.titleLbl.font = LatoFont.bold.withSize(17)
        self.messageLBl.font = LatoFont.regular.withSize(15)
        self.dateTimeLBL.font = LatoFont.regular.withSize(12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
