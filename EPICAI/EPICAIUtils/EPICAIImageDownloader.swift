//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit


public class ImageGet {
    
    func download(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else { completion(nil); return}
            completion(image)
                
        }.resume()
        
    }
    
    func download(from link: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: link) else { completion(nil); return }
        download(from: url) { (image) in
            completion(image)
        }
    }
}
