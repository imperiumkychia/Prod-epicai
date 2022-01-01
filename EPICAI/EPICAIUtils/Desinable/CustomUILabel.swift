//
//  CustomUILabel.swift
//  DAAM
//
//  Created by Abdul Fattah on 17/05/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

@IBDesignable class CustomUILabel: UILabel {
    
    @IBInspectable var applyFont: Bool = false {
        didSet {
            //self.font = applyFont
        }
    }
    
    
    @IBInspectable var applyFontTitle: Bool = false {
        didSet {
            //self.font = applyFontTitle
        }
    }
    @IBInspectable var applyFontSubTitle: Bool = false {
        didSet {
            //self.font = applyFontSubTitle
        }
    }
    
    @IBInspectable var txtColor: UIColor = UIColor.gray {
        didSet {
            self.textColor = txtColor
        }
    }
}
