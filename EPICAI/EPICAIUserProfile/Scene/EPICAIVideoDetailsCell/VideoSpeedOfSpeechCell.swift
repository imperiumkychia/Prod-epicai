//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import SnapKit

class VideoSpeedOfSpeechCell: UITableViewCell {
    
    
    private var titleLabel: UILabel!
    private var gaugeView: GaugeView!
    private var explanationTitleLabel: UILabel!
    private var dividerView: UIView!

    var value: Double = 0.0 {
        didSet {
            if gaugeView != nil {
                gaugeView.value = value
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
        titleLabel.text = "Speed of Speech"
        contentView.addSubview(titleLabel)
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        
        gaugeView = GaugeView(frame: contentView.bounds)
        gaugeView.translatesAutoresizingMaskIntoConstraints = false
        gaugeView.backgroundColor = backgroundColor
        gaugeView.valueFont = UIFont(name: "Avenir-Black", size: 60) ??
            UIFont.systemFont(ofSize: 60.0, weight: .black)
        gaugeView.valueTextColor = Palette.V2.V2_pageControlIndicatorSelected
        gaugeView.unitOfMeasurement = "Words/Minute"
        gaugeView.unitOfMeasurementFont = LatoFont.regular.withSize(17.0)
        gaugeView.unitOfMeasurementTextColor = Palette.V2.V2_feedsDate
        gaugeView.showMinMaxValue = false
        gaugeView.showLimitDot = false
        gaugeView.minValue = 0
        gaugeView.maxValue = 300
        gaugeView.numOfSubDivisions = 0
        gaugeView.numOfDivisions = 0
        gaugeView.ringThickness = 30.0
        gaugeView.ringBackgroundColor = Palette.V2.V2_VCBackground
        gaugeView.needleFillColor = Palette.V2.V2_pageControlIndicatorSelected
        contentView.addSubview(gaugeView)
        
        explanationTitleLabel = UILabel(frame: .zero)
        explanationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        explanationTitleLabel.textColor = Palette.V2.V2_SettingsTableHeader
        explanationTitleLabel.font = LatoFont.regular.withSize(14.0)
        explanationTitleLabel.textAlignment = .center
        explanationTitleLabel.numberOfLines = 0
        explanationTitleLabel.text = "Standard presentation pace between 120 wpm and 150 wpm.\nFast: more than 160 wpm.\nRadio hosts and podcasters speak at 150-160 wpm."
        contentView.addSubview(explanationTitleLabel)
        
        
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
        
        gaugeView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(contentView).offset(2 * itemsMargin)
            make.trailing.equalTo(contentView).offset(-2 * itemsMargin)
            make.height.equalTo(220.0)
        }
        
        explanationTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(gaugeView.snp.bottom).offset(-itemsMargin)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
            make.bottom.equalTo(dividerView.snp.top).offset(-itemsMargin)
        }
    }
}
