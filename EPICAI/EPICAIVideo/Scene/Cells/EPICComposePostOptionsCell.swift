//
//  ResultWithVideoCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 24/12/21.
//

import UIKit


class EPICComposePostOptionsCell: UITableViewCell {
    
    var switchState:((Bool)-> Void) = { _ in }
    
    static let identifier:String = "EPICComposePostOptionsCell"
    
    @IBOutlet weak var uploadOptionSwitch:UISwitch!
    @IBOutlet weak var optionTitleLbl:UILabel!
    
    @IBAction func toggleSwitch(_ sender:UISwitch) {
        if sender.isOn {
            switchState(true)
        }
        else {
            switchState(false)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.optionTitleLbl != nil {
            self.optionTitleLbl.font = LatoFont.bold.withSize(15.0)
            self.optionTitleLbl.textColor = Palette.V2.V2_VCTitle
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

