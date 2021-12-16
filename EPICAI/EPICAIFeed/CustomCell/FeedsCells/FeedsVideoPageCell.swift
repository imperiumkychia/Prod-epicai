//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import UIKit
import FSPagerView
import SnapKit
import Player

class FeedsVideoPageCell: FSPagerViewCell {
    
    private var previewView: Player!
    private var playButtonContainer: UIView!
    private var playButton: UIButton!
    private var snapshotImageView: UIImageView!
    
    var videoURL: URL? {
        didSet {
            previewView.url = videoURL
            previewView.stop()
            previewView.takeSnapshot { image, error in
                DispatchQueue.main.async {
                    self.snapshotImageView.image = image
                }
            }
            playButtonContainer.isHidden = videoURL == nil
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.backgroundColor = backgroundColor
        contentView.layer.shadowRadius = 0.0
        
        previewView = Player()
        previewView.view.frame = contentView.bounds
        previewView.view.translatesAutoresizingMaskIntoConstraints = true
        previewView.playerDelegate = self
        previewView.playbackDelegate = self
        previewView.fillMode = .resizeAspectFill
        previewView.playbackPausesWhenBackgrounded = true
        previewView.playbackPausesWhenResigningActive = true
        previewView.playbackResumesWhenEnteringForeground = false
        previewView.playbackResumesWhenBecameActive = false
        
        
        contentView.addSubview(previewView.view)
        
        snapshotImageView = UIImageView(frame: .zero)
        snapshotImageView.translatesAutoresizingMaskIntoConstraints = false
        snapshotImageView.image = #imageLiteral(resourceName: "noVideo")
        snapshotImageView.contentMode = .scaleAspectFill
        contentView.addSubview(snapshotImageView)

        playButtonContainer = UIView(frame: .zero)
        playButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        playButtonContainer.backgroundColor = .white.withAlphaComponent(0.2)
        playButtonContainer.layer.cornerRadius = 50.0
        contentView.addSubview(playButtonContainer)
        playButtonContainer.isHidden = true
        
        playButton = UIButton(frame: .zero)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(#imageLiteral(resourceName: "playFeed"), for: .normal)
        let imageInset: CGFloat = 35.0
        playButton.imageEdgeInsets = UIEdgeInsets(top: imageInset, left: imageInset, bottom: imageInset, right: imageInset)
        playButton.addTarget(self, action: #selector(didTapOnPlay(_:)), for: .touchUpInside)
        playButtonContainer.addSubview(playButton)
        
        
        snapshotImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        playButtonContainer.snp.makeConstraints { (make) in
            make.width.equalTo(playButtonContainer.layer.cornerRadius * 2.0)
            make.height.equalTo(playButtonContainer.layer.cornerRadius * 2.0)
            make.center.equalTo(previewView.view)
        }
        
        playButton.snp.makeConstraints { (make) in
            make.edges.equalTo(playButtonContainer)
        }
        
        
    }
    
    @objc private func didTapOnPlay(_ sender: UIButton) {
        snapshotImageView.isHidden = true
        if previewView.playbackState == .playing {
            previewView.pause()
        } else {
            previewView.playFromCurrentTime()
        }
        
    }
}

extension FeedsVideoPageCell: PlayerDelegate, PlayerPlaybackDelegate {
    func playerReady(_ player: Player) {
        
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        if player.playbackState == .playing {
            playButton.setImage(#imageLiteral(resourceName: "pauseFeed"), for: .normal)
        } else {
            playButton.setImage(#imageLiteral(resourceName: "playFeed"), for: .normal)
        }
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
    
    func playerCurrentTimeDidChange(_ player: Player) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {

    }
    
    func playerPlaybackDidEnd(_ player: Player) {

    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    func playerPlaybackDidLoop(_ player: Player) {
        
    }
    
    
}
