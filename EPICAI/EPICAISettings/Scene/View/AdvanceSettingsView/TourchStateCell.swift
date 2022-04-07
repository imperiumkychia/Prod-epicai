//
//  TourchStateCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 12/02/22.
//

import UIKit
import Amplify

class TourchStateCell: UITableViewCell {
    
    static var identifier = "TourchStateCell"
    
    @IBOutlet weak var textLBL:UILabel!
    @IBOutlet weak var optionSwitch:UISwitch!
    
    @IBAction func switchState(_ sender :UISwitch) {
        if sender.isOn {
            EPICAISharedPreference.advanceSetting?.tourchState = true
        }else {
            EPICAISharedPreference.advanceSetting?.tourchState = false
        }
    }
    
    var switchState:Bool? {
        didSet {
            guard let state = switchState else { return }
            self.optionSwitch.isOn = state
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLBL.font = LatoFont.bold.withSize(18)
        self.textLBL.textColor = Palette.V2.V2_VCTitle
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
