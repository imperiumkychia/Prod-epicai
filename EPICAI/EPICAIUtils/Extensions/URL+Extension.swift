//
//  URL+Extension.swift
//  EPICAI
//
//  Created by Abdul fattah on 31/12/21.
//

import Foundation
import AVFoundation

extension URL {
    
    func getResourceSize() -> String? {
        do {
            let resources = try self.resourceValues(forKeys:[.fileSizeKey])
            if let fileSize = resources.fileSize {
                return String(describing: NSNumber(integerLiteral: fileSize))
            }
            else { return nil }
        }
        catch { return nil }
    }
    
    func getDuration() -> Double {
        let asset = AVAsset(url: self)
        return asset.duration.seconds
    }
}


