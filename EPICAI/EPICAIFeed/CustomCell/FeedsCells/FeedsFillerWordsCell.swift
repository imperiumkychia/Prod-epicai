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
import Charts

class FeedsFillerWordsCell: FSPagerViewCell {
        
    private var titleLabel: UILabel!
    private var infoStackView: UIStackView!
    
    var data: [FillerWordType] = [] {
        didSet {
            configureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = Palette.V2.V2_VCBackground
        contentView.backgroundColor = backgroundColor
        contentView.layer.shadowRadius = 0.0

        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.font = LatoFont.bold.withSize(19.0)
        titleLabel.textAlignment = .left
        titleLabel.text = "Filler Words"
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
        }
        
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
        infoStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView).offset(-20.0)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom).offset(20.0)
        }
        
        
        
        
    }
    
    
}

typealias FillerWordType = (title: String, color: UIColor, value: Int)

class FillerWrodItemView: UIView {
    
    var value: Int = 0
    var title: String = ""
    var color: UIColor = .lightGray
    
    private var titleLabel: UILabel!
    private var valueLabel: UILabel!
    private var colorView: UIView!
    
    init(title: String, color: UIColor, value: Int) {
        super.init(frame: .zero)
        self.title = title
        self.value = value
        self.color = color
        configureUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        colorView = UIView(frame: .zero)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        let cvCornerRadius: CGFloat = 6.0
        colorView.layer.cornerRadius = cvCornerRadius
        colorView.backgroundColor = self.color
        addSubview(colorView)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_tonalityLegendTitle.withAlphaComponent(0.7)
        titleLabel.font = LatoFont.regular.withSize(20.0)
        titleLabel.textAlignment = .left
        titleLabel.text = self.title
        addSubview(titleLabel)
        
        valueLabel = UILabel(frame: .zero)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textColor = Palette.V2.V2_tonalityLegendTitle
        valueLabel.font = LatoFont.regular.withSize(20.0)
        valueLabel.textAlignment = .left
        valueLabel.text = "\(self.value)"
        addSubview(valueLabel)
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(150.0)
            
        }
        
        colorView.snp.makeConstraints { (make) in
            make.height.equalTo(cvCornerRadius * 2)
            make.width.equalTo(cvCornerRadius * 2.0)
            make.leading.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(colorView.snp.trailing).offset(5.0)
            make.centerY.equalTo(self)
            make.width.equalTo(30.0)
            
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(valueLabel.snp.trailing)
            make.trailing.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        
    }
}

