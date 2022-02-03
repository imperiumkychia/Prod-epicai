//
//  String+Extensions.swift
//  EPICAI
//
//  Created by Abdul fattah on 14/12/21.
//

import Foundation
import CoreGraphics
import UIKit

extension String {
    func isEmptyString() -> Bool {
        if (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
            return true;
        }
        else{
            return false;
        }
    }
    
    static var uuidString:String {
        return UUID().uuidString
    }
    
    func sizeOfString (font: UIFont, constrainedToWidth width: Double) -> CGSize {
           let attributes = [NSAttributedString.Key.font:font,]
           let attString = NSAttributedString(string: self,attributes: attributes)
           let framesetter = CTFramesetterCreateWithAttributedString(attString)
           return CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(location: 0,length: 0), nil, CGSize(width: width, height: Double.greatestFiniteMagnitude), nil)
    }
}


