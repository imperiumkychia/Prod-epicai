
import MobileCoreServices
import UIKit
import Foundation
import AVFoundation

protocol ExpandingCellDelegate {
    func updatedHeight(height: CGFloat,textView: UITextView)
}

class PostCellTV: UITableViewCell  {
    
    @IBOutlet weak var nameLbl: CustomUILabel!
    @IBOutlet weak var bioLbl: CustomUILabel!
    @IBOutlet weak var expendTextView: UITextView!
    @IBOutlet weak var postVideoView: UIView!
    @IBOutlet weak var postImageView: CustomImageView!
    @IBOutlet weak var profileImageView: CustomUIImageView!
    
    var delegate: ExpandingCellDelegate?
    static let identifierProfile:String = "identifierprofile"
    static let identifierText:String = "identifiertext"
    static let identifierImageVideo:String = "identifierimagevideo"
    @IBOutlet weak var crossView: UIView!
    @IBOutlet weak var crossBtn: UIButton!
    
    var videoLayer: AVPlayerLayer = AVPlayerLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if self.profileImageView != nil {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2
            self.profileImageView.clipsToBounds = true
            nameLbl.text = "\(EPICAISharedPreference.userSession?.firstName ?? "") \(EPICAISharedPreference.userSession?.lastName ?? "")"
            if let imagePath = EPICAISharedPreference.userSession?.imageUrl {
                self.profileImageView.loadImageFromUrl(urlString: imagePath, placeHolderImg: nil)
            }
        }
        
        if self.expendTextView != nil {
            self.expendTextView.textColor = UIColor.lightGray
            self.expendTextView.delegate = self
            self.expendTextView.text = "Video title..."
            self.expendTextView.leftSpace()
        }
        
        if self.postImageView != nil {
            videoLayer.backgroundColor = UIColor.clear.cgColor
            videoLayer.videoGravity = AVLayerVideoGravity.resize
            postImageView.layer.addSublayer(videoLayer)
            selectionStyle = .none
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func textViewData(creadtedText: String) {
        if self.expendTextView != nil{
            self.expendTextView.textColor = UIColor.black
            self.expendTextView.text = creadtedText
        }
    }
    
    func configureCell(imageUrl: String?,videoUrl: String?) {
        self.postImageView.isHidden = false
        if imageUrl == "placeholderanimation2" {
            self.postImageView.image = UIImage(named: "placeholdervideo")
        }
        else{
            if let letImagePath = imageUrl {
                self.postImageView.loadImageFromUrl(urlString: letImagePath, placeHolderImg: nil)
            }
        }
    }
    
    override func prepareForReuse() {
        if self.postImageView != nil {
            //postImageView.imageURL = nil
            super.prepareForReuse()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let horizontalMargin: CGFloat = 20
        let width: CGFloat = bounds.size.width - horizontalMargin * 2
        let height: CGFloat = (width * 0.9).rounded(.up)
        videoLayer.frame = CGRect(x: 0, y: 0, width: width, height: height)
    }
    
    func visibleVideoHeight() -> CGFloat {
        let videoFrameInParentSuperView: CGRect? = self.superview?.superview?.convert(postImageView.frame, from: postImageView)
        guard let videoFrame = videoFrameInParentSuperView,
              let superViewFrame = superview?.frame else {
                  return 0
              }
        let visibleVideoFrame = videoFrame.intersection(superViewFrame)
        return visibleVideoFrame.size.height
    }
}


extension PostCellTV: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let height = textView.newHeight(withBaseHeight: 120)
        delegate?.updatedHeight(height: height,textView:textView)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "MessageConstant.Text_View_Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            return false
        }
        return true
    }
}
