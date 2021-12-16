//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.hasPrefix("#") { _ = string.removeFirst() }
        
        if !string.count.isMultiple(of: 2), let last = string.last { string.append(last) }
        
        if string.count > 8 { string = String(string.prefix(8)) }
        
        let scanner = Scanner(string: string)
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            let g = Int(color) & mask
            let gray = Double(g) / 255.0
            self.init(displayP3Red: gray, green: gray, blue: gray, alpha: 1)
            
        } else if string.count == 4 {
            let mask = 0x00FF
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            self.init(displayP3Red: gray, green: gray, blue: gray, alpha: alpha)
            
        } else if string.count == 6 {
            let mask = 0x0000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(displayP3Red: red, green: green, blue: blue, alpha: 1)
            
        } else if string.count == 8 {
            let mask = 0x000000FF
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(displayP3Red: red, green: green, blue: blue, alpha: alpha)
            
        } else { self.init(displayP3Red: 1, green: 1, blue: 1, alpha: 1) }
    }

    static func darkModeColor(hexString: String) -> UIColor {
        let lightColor = UIColor(hex: hexString)
        return {
            if #available(iOS 13.0, *) {
                return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                    switch traitCollection.userInterfaceStyle {
                    case
                            .unspecified,
                            .light: return lightColor
                    case .dark: return lightColor.inverted
                    @unknown default:
                        return lightColor
                    }
                }
            } else {
                return lightColor
            }
        }()
    }
    
    static func modedColor(light: String, dark: String) -> UIColor {
        let lightColor = UIColor(hex: light)
        let darkColor = UIColor(hex: dark)
        return {
            if #available(iOS 13.0, *) {
                return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                    switch traitCollection.userInterfaceStyle {
                    case
                            .unspecified,
                            .light: return lightColor
                    case .dark: return darkColor
                    @unknown default:
                        return lightColor
                    }
                }
            } else {
                return lightColor
            }
        }()
    }
    
    var inverted: UIColor {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return UIColor(red: (1 - r), green: (1 - g), blue: (1 - b), alpha: a)
    }
    
    var darkModed: UIColor {
        return {
            if #available(iOS 13.0, *) {
                return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                    switch traitCollection.userInterfaceStyle {
                    case
                            .unspecified,
                            .light: return self
                    case .dark: return self.inverted
                    @unknown default:
                        return self
                    }
                }
            } else {
                return self
            }
        }()
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

