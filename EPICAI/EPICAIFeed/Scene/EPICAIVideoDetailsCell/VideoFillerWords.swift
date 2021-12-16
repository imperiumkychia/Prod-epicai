//
//  VideoFillerWords.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 15/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//


import Foundation
import SnapKit
import Charts

class VideoFillerWords: UITableViewCell {
    private var titleLabel: UILabel!
    private var dividerView: UIView!
    private var infoStackView: UIStackView!
    
    var data: [FillerWordType] = [] {
        didSet {
            setupElements()
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
        titleLabel.text = "Tonality"
        contentView.addSubview(titleLabel)
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        var views = [FillerWrodItemView]()
        
        for item in data {
            views.append(FillerWrodItemView(title: item.title, color: item.color, value: item.value))
        }
        
        infoStackView = UIStackView(arrangedSubviews: views)
        infoStackView.axis = .vertical
        infoStackView.alignment = .center
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = 15.0
        contentView.addSubview(infoStackView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
        }
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
        }
        
        infoStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(dividerView.snp.top).offset(-itemsMargin)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom).offset(itemsMargin)
        }
    }
}


