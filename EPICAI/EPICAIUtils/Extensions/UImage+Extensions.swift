//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

extension CGImage {
    
    func drawPoints(points:[CGPoint]) -> UIImage? {
        //print("Points in Draw \(points)")
        let cntx = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: bitsPerComponent , bytesPerRow: 0, space: colorSpace ?? CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        
        cntx?.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        for point in points {
            cntx?.setFillColor(red: 0, green: 1, blue: 0, alpha: 1)
            cntx?.addArc(center: point, radius: 3, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: false)
            cntx?.drawPath(using: .fill)
        }
        let _cgim = cntx?.makeImage()
        if let cgi = _cgim {
            let img = UIImage(cgImage: cgi)
            return img
        }
        return nil
    }
}

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

import CoreGraphics

extension CGImage {
    var size: CGSize {
        return CGSize(width: width, height: height)
    }
}

