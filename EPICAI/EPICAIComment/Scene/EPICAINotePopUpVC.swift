import UIKit

protocol EPICAINotePopUpProtocol {
    func addReplyOnCommnet(indexPath:IndexPath, message:String)
}

class EPICAINotePopUpVC: UIViewController , UITextViewDelegate{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        notesdata.autocorrectionType = .no
        notesdata.layer.borderColor = UIColor.lightGray.cgColor
        notesdata.layer.borderWidth = 0.5
        
        if forwardnotes == "" {
            maxLimit.text = "0/1000 (Max. 1000 characters)"
            maxLimit.textColor = UIColor.black
            notesdata.text = "Reply..."
            notesdata.textColor = UIColor.lightGray
        }
        else {
            notesdata.text = forwardnotes
            notesdata.textColor = UIColor.black
            if notesdata.text.count == 1000 {
                maxLimit.textColor = UIColor.init(hex: "FF3F39")
            }
            maxLimit.text = "\(notesdata.text.count)/1000 (Max. 1000 characters)"
        }
        
        // headingTitle.font = UtilityClasses.setFontSizeForButton()
        // addNotesBtn.titleLabel?.font = UtilityClasses.setFontSizeForButton()
        // cancel.titleLabel?.font = UtilityClasses.setFontSizeForButton()
    }
    
    func lines(yourLabel : UITextView) -> Int {
        var lineCount = 0;
        let textSize = CGSize(width: yourLabel.frame.size.width, height: CGFloat(Float.infinity))
        let rHeight = lroundf(Float(yourLabel.sizeThatFits(textSize).height))
        let charSize = lroundf(Float((yourLabel.font?.lineHeight)!));
        lineCount = rHeight/charSize
        return lineCount
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let contentSize = textView.sizeThatFits(textView.bounds.size)
        let pos = textView.endOfDocument
        let currentRect = textView.caretRect(for: pos)
        if(currentRect.origin.y > previousRect.origin.y){
            totalnumberoflines = totalnumberoflines + 1
            
            if contentSize.height > notesdata.frame.size.height {
                detectscroll = true
                linechange = true
//                topSize.constant = topSize.constant - 14
//                if topSize.constant <= 40 {
//                    topSize.constant = 40
//                }
            }
            if !detectscroll {
                detectlinenumber = detectlinenumber + 1
            }
        }
        else
        {
            let  char = lastchar.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            if detectscroll {
                if (isBackSpace == -92) {
                    if textView.frame.size.height < textView.contentSize.height {
                    }
                    else
                    {
                        var noofline = self.lines(yourLabel: textView)
                        noofline = noofline - 1
                        if noofline < totalnumberoflines {
                            totalnumberoflines = noofline
                            
//                            topSize.constant = topSize.constant + 15
//                            if topSize.constant >= 100 {
//                                topSize.constant = 100
//                            }
                        }
                    }
                }
            }
        }
        previousRect = currentRect
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(textView.text.count >= 1000)
        {
            let  char = text.cString(using: String.Encoding.utf8)!
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                maxLimit.textColor = UIColor.black
            }
            else{
                maxLimit.text = "1000/1000 (Max. 1000 characters)"
                maxLimit.textColor = UIColor.init(hex: "FF3F39")
                return false
            }
        }
        lastchar = text
        let  char = text.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            if textView.text == "" {
                maxLimit.text = "0/1000 (Max. 1000 characters)"
                maxLimit.textColor = UIColor.black
                textView.text = "Reply..."
                textView.textColor = UIColor.lightGray
                textView.resignFirstResponder()
            }
        }
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        var newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars:Int = newText.count
        if numberOfChars > 1000 {
            let index = newText.index(newText.startIndex, offsetBy: 1000)
            newText = String(newText[..<index])
            textView.text = newText
            maxLimit.text = "1000/1000 (Max. 1000 characters)"
            maxLimit.textColor = UIColor.init(hex: "FF3F39")
        }
        else {
            if numberOfChars == 1000 {
                maxLimit.textColor = UIColor.init(hex: "FF3F39")
                self.view.endEditing(true)
            }
            else{
                maxLimit.textColor = UIColor.black
            }
            maxLimit.text = "\(numberOfChars)/1000 (Max. 1000 characters)"
        }
        return numberOfChars <= 1000
    }
    
    //MARK: View Didload
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray || textView.text == "Reply..." {
            textView.text = nil
            textView.textColor = Palette.V2.V2_VCTitle
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Reply..."
            textView.textColor = UIColor.lightGray
            textView.resignFirstResponder()
        }
    }
    
    @IBAction func notesAdd(_ sender: Any) {
        self.view.endEditing(true)
        if !notesdata.text.isEmptyString() && notesdata.text != "Reply..." {
            if let text = self.notesdata.text {
                self.delegate?.addReplyOnCommnet(indexPath: self.indexPath, message: text)
                self.dismiss(animated: true, completion: nil)
            }
        }
        else{
            EPICAIGenericAlertView().show(title: "Error", message: "Please enter your comment", onViewController: self) {}
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    var detectscroll = false
    var detectlinenumber = 0
    var totalnumberoflines = 0
    var linechange = false
    var lastchar = ""
    var previousRect = CGRect()
    var forwardnotes = String()
    var notesPopUpOpenFrom = String()
    var indexPath:IndexPath!
    var delegate:EPICAINotePopUpProtocol?
    
    @IBOutlet weak var addNotesBtn: UIButton!
    @IBOutlet var cancel: UIButton!
    //@IBOutlet var topSize: NSLayoutConstraint!
    @IBOutlet var notesdata: UITextView!
    @IBOutlet var headingTitle: UILabel!
    @IBOutlet weak var maxLimit: UILabel!
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

