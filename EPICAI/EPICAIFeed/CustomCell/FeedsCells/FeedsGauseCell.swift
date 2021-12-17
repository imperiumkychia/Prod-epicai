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

class FeedsGauseCell: FSPagerViewCell {
    
    private var gaugeView: GaugeView!
    
    var value: Double = 0.0 {
        didSet {
            if gaugeView != nil {
                gaugeView.value = value
            }
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
        backgroundColor = Palette.V2.V2_VCBackground
        contentView.backgroundColor = backgroundColor
        contentView.layer.shadowRadius = 0.0

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
    }
    
    
}
