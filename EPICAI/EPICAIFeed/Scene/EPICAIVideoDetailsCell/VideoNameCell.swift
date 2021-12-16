//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import SnapKit

protocol VideoNameCellDelegate: AnyObject {
    func videoNameCell(_ cell: VideoNameCell, didAskToShowMoreForVideo videoUUID: String?)
}

class VideoNameCell: UITableViewCell {
    
    weak var delegate: VideoNameCellDelegate?
    
    private var titleLabel: UILabel!
    private var moreButton: UIButton!
    private var dateLabel: UILabel!
    private var scoreLabel: UILabel!
    
    var videoName: String? = nil {
        didSet {
            titleLabel.text = videoName
        }
    }
    
    var videoDate: String? = nil {
        didSet {
            dateLabel.text = videoDate
        }
    }
    
    var videoScore: String? = nil {
        didSet {
            scoreLabel.text = videoScore
        }
    }
    
    var videoUUID: String?
    
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
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
        }
        
        moreButton = UIButton(frame: .zero)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        moreButton.tintColor = Palette.V2.V2_pageControlIndicatorSelected
        let img = UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30.0, weight: .bold))
        moreButton.setImage(img, for: .normal)
        moreButton.addTarget(self, action: #selector(moreButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(moreButton)
        moreButton.snp.makeConstraints { (make) in
            make.width.equalTo(40.0)
            make.height.equalTo(40.0)
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
        }
        
        dateLabel = UILabel(frame: .zero)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = LatoFont.regular.withSize(13.0)
        dateLabel.textColor = Palette.V2.V2_feedsDate
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(contentView).offset(itemsMargin)
        }
        
        scoreLabel = UILabel(frame: .zero)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = LatoFont.bold.withSize(14.0)
        scoreLabel.textColor = Palette.V2.V2_pageControlIndicatorSelected
        contentView.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(dateLabel)
        }
    }
    
    @objc private func moreButtonTapped(_ sender: UIButton) {
        delegate?.videoNameCell(self, didAskToShowMoreForVideo: videoUUID)
    }
}
