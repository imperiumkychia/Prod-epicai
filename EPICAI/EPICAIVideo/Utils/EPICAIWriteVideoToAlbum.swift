//
//  EPICAIWriteVideoToAlbum.swift
//  EPICAI
//
//  Created by Abdul fattah on 20/12/21.
//

import Foundation
import Photos
import UIKit

class VideoWriterToAlbum {
    
    static func checkPhotoLibraryPermissionToWriteVideoFor(url:URL, completion:@escaping (String?) -> Void)  {
        switch(PHPhotoLibrary.authorizationStatus()) {
        case .authorized:
            if let message  = self.writeVideoInPhotoAlbum(url: url) {
                completion(message)
            }
            else {
                completion("Error in saving video")
            }
        case .denied: completion("Permission denied.")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    if let _ =  self.writeVideoInPhotoAlbum(url: url) {
                        completion("Video saved successfully.")
                    }
                    else {
                        completion("Error in video saving")
                    }
                }
                else {
                    completion("Error in video saving")
                }
            }
        case .restricted: completion("Permission restricted to write video in photo album.")
        default: completion(nil)
        }
    }
    
    static func writeVideoInPhotoAlbum(url:URL) -> String? {
        let errorString:String? = "Error in video saving"
        DispatchQueue.main.async {
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: url.path))
            }) { completed, error in
                guard completed else {
                    print ("Error: Cannot move the video \(url.path) to camera roll, error: \(String(describing: error?.localizedDescription))")
                    return
                }
            }
        }
        return errorString
    }
    
    static func getVideoTransform() -> CGAffineTransform {
        switch UIApplication.shared.windows.first?.windowScene?.interfaceOrientation {
        case .portrait:
            return .identity
        case .portraitUpsideDown:
            return CGAffineTransform(rotationAngle: .pi)
        case .landscapeLeft:
            return CGAffineTransform(rotationAngle: .pi/2)
        case .landscapeRight:
            return CGAffineTransform(rotationAngle: -.pi/2)
        default:
            return .identity
        }
    }
    
    func write(image overlayImage:UIImage, toBuffer sample:CMSampleBuffer){
        if let pixelBuffer = CMSampleBufferGetImageBuffer(sample){
            CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            var bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Little.rawValue
            bitmapInfo |= CGImageAlphaInfo.premultipliedFirst.rawValue & CGBitmapInfo.alphaInfoMask.rawValue
            let context = CGContext(data: CVPixelBufferGetBaseAddress(pixelBuffer), width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer), space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: bitmapInfo)
            context?.draw(overlayImage.cgImage!, in: CGRect(x: 0.0, y: 0.0, width: overlayImage.size.width, height: overlayImage.size.height))
            CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
        }
    }
    
}
