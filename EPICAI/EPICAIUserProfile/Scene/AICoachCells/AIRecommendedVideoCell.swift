//
//  AIRecommendedVideoCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 02/03/22.
//

import UIKit
import Player

class AIRecommendedVideoCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var previewView: Player!
    private var playButtonContainer: UIView!
    private var playButton: UIButton!
    private var snapshotImageView: UIImageView!
    private var dividerView: UIView!

    var videoURL: URL? = nil {
        didSet {
            previewView.url = videoURL
            previewView.stop()
            previewView.takeSnapshot { image, error in
                self.snapshotImageView.image = image
            }
        }
    }

    
    private let itemsMargin: CGFloat = 20.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupElements() {
        selectionStyle = .none
        self.backgroundColor = Palette.V2.V2_VCBackground
        self.contentView.backgroundColor = self.backgroundColor
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.font = LatoFont.bold.withSize(19.0)
        titleLabel.textAlignment = .left
        titleLabel.text = "Recommendation of improvement"
        contentView.addSubview(titleLabel)
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        previewView = Player()
        previewView.view.frame = contentView.bounds
        previewView.view.translatesAutoresizingMaskIntoConstraints = true
        previewView.playerDelegate = self
        previewView.playbackDelegate = self
        previewView.fillMode = .resizeAspect
        previewView.playbackPausesWhenBackgrounded = true
        previewView.playbackPausesWhenResigningActive = true
        previewView.playbackResumesWhenEnteringForeground = false
        previewView.playbackResumesWhenBecameActive = false
        previewView.view.layer.cornerRadius = 25.0
        previewView.view.layer.cornerCurve = .continuous
        previewView.view.clipsToBounds = true
        contentView.addSubview(previewView.view)
        
        snapshotImageView = UIImageView(frame: .zero)
        snapshotImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(snapshotImageView)

        playButtonContainer = UIView(frame: .zero)
        playButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        playButtonContainer.backgroundColor = .white.withAlphaComponent(0.2)
        playButtonContainer.layer.cornerRadius = 50.0
        contentView.addSubview(playButtonContainer)
        
        
        playButton = UIButton(frame: .zero)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(#imageLiteral(resourceName: "playFeed"), for: .normal)
        let imageInset: CGFloat = 35.0
        playButton.imageEdgeInsets = UIEdgeInsets(top: imageInset, left: imageInset, bottom: imageInset, right: imageInset)
        playButton.addTarget(self, action: #selector(didTapOnPlay(_:)), for: .touchUpInside)
        playButtonContainer.addSubview(playButton)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
            make.height.equalTo(40)
        }
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        previewView.view.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(dividerView.snp.bottom).offset(-10)
            make.leading.equalTo(contentView).offset(2 * itemsMargin)
            make.trailing.equalTo(contentView).offset(-2 * itemsMargin)
        }
        
        snapshotImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(previewView.view)
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

extension AIRecommendedVideoCell: PlayerDelegate, PlayerPlaybackDelegate {
    
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
