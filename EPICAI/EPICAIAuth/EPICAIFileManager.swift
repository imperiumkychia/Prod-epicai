//
//  EPICAIFileManager.swift
//  EPICAI
//
//  Created by Abdul fattah on 15/12/21.
//

import Foundation
import UIKit

class EPICAIFileManager {
    class func saveEPICAIUserSessionImage(image: UIImage) {
        let fileName = "EPICAIProfilePic.png"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.pngData() else { return }
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    class func getEPICAIUserSessionImage() -> UIImage? {
        let named = "EPICAIProfilePic.png"
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    class func filePathEPICAIUserSessionImage() -> URL? {
        let file = "EPICAIProfilePic.png"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            if FileManager.default.fileExists(atPath: fileURL.path) {
                return fileURL
            }
            return nil
        }
        return nil
    }
}
