
import MobileCoreServices
import UIKit
import Foundation
import AVFoundation

protocol ExpandingCellDelegate {
    func updatedHeight(height: CGFloat,textView: UITextView)
}

class EPICAIComposePostPCell: UITableViewCell  {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var expendTextView: UITextView!
    @IBOutlet weak var profileImageView: CustomUIImageView!
    
    var delegate: ExpandingCellDelegate?
    static let identifierProfile:String = "identifierprofile"
    static let identifierText:String = "identifiertext"
    static let identifierImageVideo:String = "identifierimagevideo"
    @IBOutlet weak var crossView: UIView!
    @IBOutlet weak var crossBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customUISetUp()
        
        if self.profileImageView != nil {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2
            self.profileImageView.clipsToBounds = true
            nameLbl.text = "\(EPICAISharedPreference.userSession?.firstName ?? "") \(EPICAISharedPreference.userSession?.lastName ?? "")"
            
            print("User Name: \(EPICAISharedPreference.userSession?.firstName ?? "")")
            if let image = EPICAIFileManager.shared().getEPICAIUserSessionImage(){
                self.profileImageView.image = image
            }
            else {
                self.profileImageView.image = #imageLiteral(resourceName: "noProfileImage")
            }
        }
        
        if self.expendTextView != nil {
            self.expendTextView.textColor = UIColor.lightGray
            self.expendTextView.delegate = self
            self.expendTextView.text = videoTitlePlaceHolder
            self.expendTextView.leftSpace()
        }
    }
    
    private func customUISetUp() {
        if self.nameLbl != nil {
            self.nameLbl.textColor = Palette.V2.V2_VCTitle
            self.nameLbl.font = LatoFont.bold.withSize(20)
        }
        if self.expendTextView != nil {
            self.expendTextView.textColor = Palette.V2.V2_VCTitle
            self.expendTextView.font = LatoFont.bold.withSize(17)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func textViewData(creadtedText: String) {
        if self.expendTextView != nil{
            self.expendTextView.textColor = Palette.V2.V2_VCTitle
            self.expendTextView.text = creadtedText
        }
    }
    
    override func prepareForReuse() {
            //postImageView.imageURL = nil
            super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}


extension EPICAIComposePostPCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let height = textView.newHeight(withBaseHeight: 120)
        delegate?.updatedHeight(height: height,textView:textView)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = Palette.V2.V2_VCTitle
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = videoTitlePlaceHolder
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
