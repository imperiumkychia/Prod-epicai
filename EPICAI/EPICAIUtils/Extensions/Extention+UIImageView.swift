//
//  Extention+UIImageView.swift
//  DaamFeedPage
//
//  Created by Abdul on 23/08/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    
    var imageUrlString:String?
    
    func loadImageFromUrl(urlString:String, fitMode contentMode:ContentMode = .scaleAspectFit, placeHolderImg:String?) {
        
        self.imageUrlString = urlString
        
        guard let imageURL = URL.init(string: urlString) else { return }
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (imgData, urlResponse, error) in
            if error != nil {
                print(error.debugDescription)
                DispatchQueue.main.async {
                    if let placeHolder = placeHolderImg {
                        self.image = UIImage(named: placeHolder)
                    }
                }
                return
            }
            DispatchQueue.main.async {
                if let httpURLResponse = urlResponse as? HTTPURLResponse, httpURLResponse.statusCode == 200 {
                    if let mimeType = httpURLResponse.mimeType, mimeType.hasPrefix("image") {
                        guard let imageToChache = UIImage(data: imgData!) else { return }
                        if self.imageUrlString == urlString {
                            self.image = imageToChache
                        }
                        imageCache.setObject(imageToChache, forKey: urlString as NSString)
                    }
                    else {
                        if let placeHolder = placeHolderImg {
                            self.image = UIImage(named: placeHolder)
                        }
                    }
                }
                else {
                    if let placeHolder = placeHolderImg {
                        self.image = UIImage(named: placeHolder)
                    }
                }
            }
        }.resume()
    }
}
