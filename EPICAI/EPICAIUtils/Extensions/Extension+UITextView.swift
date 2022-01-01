//
//  Extension+UITextView.swift
//  Daam
//
//  Created by Abdul on 28/08/19.
//  Copyright © 2019 Abdul. All rights reserved.
//


import UIKit

extension UITextView {
    /**
     Calculates if new textview height (based on content) is larger than a base height
     - parameter baseHeight: The base or minimum height
     - returns: The new height
     */
    func newHeight(withBaseHeight baseHeight: CGFloat) -> CGFloat {
        // Calculate the required size of the textview
        let fixedWidth = frame.size.width
        let newSize = sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        var newFrame = frame
        // Height is always >= the base height, so calculate the possible new height
        let height: CGFloat = newSize.height > baseHeight ? newSize.height : baseHeight
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: height)
        return newFrame.height
    }
}

extension UITextView {
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 4)
    }
}
