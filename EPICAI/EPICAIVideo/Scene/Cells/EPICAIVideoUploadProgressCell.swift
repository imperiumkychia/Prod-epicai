//
//  EPICAIVideoUploadProgressCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 05/01/22.
//

import UIKit

class EPICAIVideoUploadProgressCell: UITableViewCell {
    
    static var identifier = "EPICAIVideoUploadProgressCell"
    
    var cancelUploadInProgress:((Bool) -> Void) = { _ in }
    
    @IBOutlet weak var progressView:UIProgressView!
    @IBOutlet weak var progressCancelBtn:UIButton!

    
    @IBAction func cancelProgress(_ sender:UIButton) {
        self.cancelUploadInProgress(true)
    }
    
    var progress:Double? {
        didSet {
            if let progress = self.progress {
                self.progressView.progress = Float(progress)
            }
            else {
                self.progressView.progress = 0.0
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
