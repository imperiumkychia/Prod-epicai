//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import Foundation
import SnapKit
import Player

class VideoHighlightsCell: UITableViewCell {
    
    
    private var titleLabel: UILabel!
    private var previewView: Player!
    private var playButtonContainer: UIView!
    private var playButton: UIButton!
    private var snapshotImageView: UIImageView!
    private var explanationTitleLabel: UILabel!
    private var explanationDetailLabel: UILabel!
    private var dividerView: UIView!

    
    var videoName: String? = nil {
        didSet {
            titleLabel.text = videoName
        }
    }
    
    
    var videoUUID: String?
    var videoURL: URL? = nil {
        didSet {
            previewView.url = videoURL
            previewView.stop()
            previewView.takeSnapshot { image, error in
                self.snapshotImageView.image = image
            }
        }
    }
    
    var explanation: String? = nil {
        didSet {
            explanationDetailLabel.text = explanation
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
        titleLabel.text = "Highlights"
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
        previewView.fillMode = .resizeAspectFill
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
        
        explanationTitleLabel = UILabel(frame: .zero)
        explanationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationTitleLabel.textColor = Palette.V2.V2_pieChartLegendLabel
        explanationTitleLabel.font = LatoFont.regular.withSize(16.0)
        explanationTitleLabel.textAlignment = .center
        explanationTitleLabel.text = "Explanation"
        contentView.addSubview(explanationTitleLabel)
        
        explanationDetailLabel = UILabel(frame: .zero)
        explanationDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationDetailLabel.textColor = Palette.V2.V2_pieChartLegendLabel
        explanationDetailLabel.font = LatoFont.regular.withSize(14.0)
        explanationDetailLabel.textAlignment = .center
        explanationDetailLabel.numberOfLines = 0
        contentView.addSubview(explanationDetailLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
        }
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        previewView.view.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(170.0)
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
        
        explanationTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(previewView.view.snp.bottom).offset(itemsMargin)
            make.centerX.equalTo(previewView.view)
        }
        
        explanationDetailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(explanationTitleLabel.snp.bottom).offset(5.0)
            make.leading.equalTo(contentView).offset(2 * itemsMargin)
            make.trailing.equalTo(contentView).offset(-2 * itemsMargin)
            make.bottom.equalTo(dividerView.snp.top).offset(-itemsMargin)
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

extension VideoHighlightsCell: PlayerDelegate, PlayerPlaybackDelegate {
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
