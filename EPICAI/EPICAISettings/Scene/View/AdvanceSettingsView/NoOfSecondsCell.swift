//
//  NoOfSecondsCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 12/02/22.
//

import UIKit

class NoOfSecondsCell: UITableViewCell {
    
    static var identifier = "NoOfSecondsCell"
    @IBOutlet weak var secondsLBL:UILabel!
    @IBOutlet weak var checkUncheckImgVIew:UIImageView!
    
    var hasCheckmark: Bool = false {
        didSet {
            checkUncheckImgVIew.isHidden = !hasCheckmark
        }
    }
    
    var seconds:Int? {
        didSet {
            guard let timeInSec = seconds else {return}
            self.secondsLBL.text = String(timeInSec) + " Seconds"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.secondsLBL.font = LatoFont.bold.withSize(17)
        self.secondsLBL.textColor = Palette.V2.V2_VCTitle
        self.checkUncheckImgVIew.image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .regular))
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
