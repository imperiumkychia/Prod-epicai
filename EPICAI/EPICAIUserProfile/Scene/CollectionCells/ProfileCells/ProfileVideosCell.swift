//
//  ProfileVideosCell.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 11/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//


import Foundation
import SnapKit
import Player

protocol ProfileVideosCellDelegate: AnyObject {
    func profileVideoCell(_ cell: ProfileVideosCell, didAskToShareVideoItem item: EPICAIFeedItem?)
}

class ProfileVideosCell: UITableViewCell {
    
    private var statusLabel: UILabel!
    private var videoNameLabel: UILabel!
    private var videoDateLabel: UILabel!
    private var videoScoreLabel: UILabel!
    private var shareButton: UIButton!
    private var previewView: Player!
    private var playButtonContainer: UIView!
    private var playButton: UIButton!
    private var snapshotImageView: UIImageView!
    
    private var dateFormatter = DateFormatter()
    private let targetDateFormat = "dd/MM/yyyy"
    private let originalDateFormat = "yyyy-MM-dd HH:mm:ss"
    
    var item: EPICAIFeedItem? {
        didSet {
            updateValues()
        }
    }
    var user:EPICAIUser? {
        didSet {
            if let user = self.user {
                if user.uuid == EPICAISharedPreference.userSession?.uuid {
                    self.shareButton.isHidden = false
                }
                else {
                    self.shareButton.isHidden = true
                }
            }
        }
    }
    
    var videoURL: URL? = nil {
        didSet {
            previewView.url = videoURL
            previewView.stop()
            previewView.takeSnapshot { image, error in
                self.snapshotImageView.image = image
            }
        }
    }
        
    weak var delegate: ProfileVideosCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateValues() {
        guard let item = self.item else { return }
        
        print("Items :\(item)")
        
        if item.video.title == "null" || item.video.title.isEmpty ||  item.video.title == ""{
            statusLabel.text = "No title"
        }
        else {
            statusLabel.text = item.video.title
        }
        
        if item.video.status == "null" || item.video.status.isEmpty  || item.video.status == ""{
            videoNameLabel.text = "None"
        }
        else {
            videoNameLabel.text = item.video.status
        }
       
        videoDateLabel.text = formattedDateString(string: item.video.dataTime)
        videoURL = item.videoLocalURL
        videoScoreLabel.text = "score: \(item.video.score)/100"
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = Palette.V2.V2_VCBackground
        contentView.backgroundColor = backgroundColor
        
        statusLabel = UILabel(frame: .zero)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = Palette.V2.V2_VCTitle
        statusLabel.font = LatoFont.bold.withSize(18.0)
        statusLabel.textColor = Palette.V2.V2_VCTitle
        statusLabel.text = "status"
        contentView.addSubview(statusLabel)
        
        videoNameLabel = UILabel(frame: .zero)
        videoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        videoNameLabel.textAlignment = .left
        videoNameLabel.font = LatoFont.regular.withSize(12.0)
        videoNameLabel.textColor = Palette.V2.V2_VCTitle
        contentView.addSubview(videoNameLabel)
        
        videoDateLabel = UILabel(frame: .zero)
        videoDateLabel.translatesAutoresizingMaskIntoConstraints = false
        videoDateLabel.textAlignment = .right
        videoDateLabel.font = LatoFont.regular.withSize(11.0)
        videoDateLabel.textColor = Palette.V2.V2_feedsDate
        contentView.addSubview(videoDateLabel)
        
        videoScoreLabel = UILabel(frame: .zero)
        videoScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        videoScoreLabel.textAlignment = .left
        videoScoreLabel.font = LatoFont.bold.withSize(14.0)
        videoScoreLabel.textColor = Palette.V2.V2_pageControlIndicatorSelected
        contentView.addSubview(videoScoreLabel)
        
        shareButton = UIButton(frame: .zero)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.tintColor = Palette.V2.V2_pageControlIndicatorSelected
        let shareImage = UIImage(systemName: "square.and.arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .regular))
        shareButton.setImage(shareImage, for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(shareButton)
        
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
        
        statusLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10.0)
            make.leading.equalTo(contentView).offset(25)
        }
        
        videoNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(statusLabel).offset(30.0)
            make.leading.equalTo(contentView).offset(25.0)
        }
        
        videoDateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(videoNameLabel)
            make.trailing.equalTo(contentView).offset(-25.0)
        }
        
        videoScoreLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(videoNameLabel)
            make.bottom.equalTo(contentView).offset(-10.0)
        }
        
        shareButton.snp.makeConstraints { (make) in
            make.height.equalTo(30.0)
            make.width.equalTo(30.0)
            make.centerY.equalTo(videoScoreLabel)
            make.trailing.equalTo(videoDateLabel)
        }
        
        previewView.view.snp.makeConstraints { (make) in
            make.top.equalTo(videoNameLabel.snp.bottom).offset(10.0)
            make.bottom.equalTo(videoScoreLabel.snp.top).offset(-10.0)
            make.leading.equalTo(videoNameLabel).offset(-5.0)
            make.trailing.equalTo(videoDateLabel).offset(5.0)
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
    
    func formattedDateString(string: String?) -> String? {
        dateFormatter.dateFormat = originalDateFormat
        guard let string = string, let date = dateFormatter.date(from: string) else { return nil }
        dateFormatter.dateFormat = targetDateFormat
        return dateFormatter.string(from: date)
    }
    
    @objc private func didTapOnPlay(_ sender: UIButton) {
        snapshotImageView.isHidden = true
        if previewView.playbackState == .playing {
            previewView.pause()
        } else {
            previewView.playFromCurrentTime()
        }
        
    }
    
    @objc func shareButtonTapped(_ sender: UIButton) {
        self.delegate?.profileVideoCell(self, didAskToShareVideoItem: self.item)
    }
}

extension ProfileVideosCell: PlayerDelegate, PlayerPlaybackDelegate {
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


