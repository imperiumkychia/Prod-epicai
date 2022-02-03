//
//  Extension+UITableViewCell.swift
//  DaamFeedPage
//
//  Created by Abdul on 27/08/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var indexPath:IndexPath? {
        if #available(iOS 11, *) {return (self.superview as? UITableView)?.indexPath(for: self) }
        else { return (self.superview!.superview as! UITableView).indexPath(for: self)! as IndexPath }
    }
    
//    class var identifier:String {
//        return "\(self)"
//    }
}

extension UICollectionViewCell {
    
    var indexPath:IndexPath {
        if #available(iOS 11, *) {return (self.superview as! UICollectionView).indexPath(for: self)! as IndexPath }
        else { return (self.superview!.superview as! UICollectionView).indexPath(for: self)! as IndexPath }
    }
    
//    class var identifier:String {
//        return "\(self)"
//    }
}
