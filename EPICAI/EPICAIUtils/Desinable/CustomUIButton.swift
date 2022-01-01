import UIKit

@IBDesignable class CustomUIButton: UIButton {
    
    @IBInspectable var applyFont: Bool = false {
        didSet {
        }
    }
    
    @IBInspectable var applySmallFont: Bool = false {
        didSet {
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
