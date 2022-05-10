/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An initializer that creates an instance of the video orientation based on the given
 device orientation.
*/

import AVFoundation
import UIKit

extension AVCaptureVideoOrientation {
    init(deviceOrientation: UIDeviceOrientation) {
        switch deviceOrientation {
        case .landscapeLeft:
            self = .landscapeLeft
        case .landscapeRight:
            self = .landscapeRight
        case .portrait:
            self = .portrait
        case .portraitUpsideDown:
            self = .portraitUpsideDown
        default:
            self = .portrait
        }
    }
}

import Foundation


public func radians<T: FloatingPoint>(degrees: T) -> T {
    return .pi * degrees / 180
}

extension AVAsset {
    
    func cropVideoTrack(at index: Int, cropRect: CGRect, outputURL: URL, completion: @escaping (Result<Void, Swift.Error>) -> Void) {
        
        enum Orientation {
            case up, down, right, left
        }
        
        func orientation(for track: AVAssetTrack) -> Orientation {
            let t = track.preferredTransform
            
            if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0) {             // Portrait
                return .up
            } else if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0) {      // PortraitUpsideDown
                return .down
            } else if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0) {       // LandscapeRight
                return .right
            } else if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0) {     // LandscapeLeft
                return .left
            } else {
                return .up
            }
        }
        
        let videoTrack = tracks(withMediaType: .video)[index]
        let originalSize = videoTrack.naturalSize
        let trackOrientation = orientation(for: videoTrack)
        let cropRectIsPortrait = cropRect.width <= cropRect.height
        
        let videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = cropRect.size
        videoComposition.frameDuration = CMTime(value: 1, timescale: 30)
        
        let instruction = AVMutableVideoCompositionInstruction()
        instruction.timeRange = CMTimeRange(start: .zero, duration: CMTime(seconds: 60, preferredTimescale: 30))
        
        let transformer = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        
        var finalTransform: CGAffineTransform = CGAffineTransform.identity // setup a transform that grows the video, effectively causing a crop
        
        if trackOrientation == .up {
            if !cropRectIsPortrait { // center video rect vertically
                finalTransform = finalTransform
                    .translatedBy(x: originalSize.height, y: -(originalSize.width - cropRect.size.height) / 2)
                    .rotated(by: radians(degrees:CGFloat(90.0)))
            } else {
                finalTransform = finalTransform
                    .rotated(by: radians(degrees:CGFloat(90.0)))
                    .translatedBy(x: 0, y: -originalSize.height)
            }
            
        } else if trackOrientation == .down {
            if !cropRectIsPortrait { // center video rect vertically (NOTE: did not test this case, since camera doesn't support .portraitUpsideDown in this app)
                finalTransform = finalTransform
                    .translatedBy(x: -originalSize.height, y: (originalSize.width - cropRect.size.height) / 2)
                    .rotated(by: radians(degrees:CGFloat(-90.0)))
            } else {
                finalTransform = finalTransform
                    .rotated(by: radians(degrees:CGFloat(-90.0)))
                    .translatedBy(x: -originalSize.width, y: -(originalSize.height - cropRect.size.height) / 2)
            }
            
        } else if trackOrientation == .right {
            if cropRectIsPortrait {
                finalTransform = finalTransform.translatedBy(x: -(originalSize.width - cropRect.size.width) / 2, y: 0)
            } else {
                finalTransform = CGAffineTransform.identity
            }
            
        } else if trackOrientation == .left {
            if cropRectIsPortrait { // center video rect horizontally
                finalTransform = finalTransform
                    .rotated(by: radians(degrees:CGFloat(-180.0)))
                    .translatedBy(x: -originalSize.width + (originalSize.width - cropRect.size.width) / 2, y: -originalSize.height)
            } else {
                finalTransform = finalTransform
                    .rotated(by: radians(degrees:CGFloat(-180.0)))
                    .translatedBy(x: -originalSize.width, y: -originalSize.height)
            }
        }
        
        transformer.setTransform(finalTransform, at: .zero)
        instruction.layerInstructions = [transformer]
        videoComposition.instructions = [instruction]
        
        let exporter = AVAssetExportSession(asset: self, presetName: AVAssetExportPresetHighestQuality)
        exporter?.videoComposition = videoComposition
        exporter?.outputURL = outputURL
        exporter?.outputFileType=AVFileType.mov
        //exporter?.outputFileType=AVFileType.mp4
        
        
        exporter?.exportAsynchronously(completionHandler: { [weak exporter] in
            DispatchQueue.main.async {
                if let error = exporter?.error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        })
    }
}
