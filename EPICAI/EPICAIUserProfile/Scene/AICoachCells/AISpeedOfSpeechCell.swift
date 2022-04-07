//
//  AISpeedOfSpeechCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 02/03/22.
//

import UIKit

class AISpeedOfSpeechCell: UITableViewCell {

    private var titleLabel:UILabel!
    private var dividerView:UIView!
    
    private var lastVideoBLView:UIView!
    private var thisVideoBLView:UIView!
    
    private var thisVideoTitleLbl:UILabel!
    private var lastVideoTitleLbl:UILabel!

    private let itemsMargin: CGFloat = 10.0
    
    private var gaugeView: GaugeView!
    private var gaugeView1: GaugeView!
    
    var value: Double = 0.0 {
        didSet {
            self.setupElements()
            self.gaugeViewSetUp()
            if gaugeView != nil {
                gaugeView.value = value
            }
        }
    }
    
    var value1: Double = 0.0 {
        didSet {
            self.setupElements()
            self.gaugeViewSetUp1()
            if gaugeView1 != nil {
               gaugeView1.value = value1
            }
        }
    }
    
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
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.font = LatoFont.bold.withSize(19.0)
        titleLabel.textAlignment = .left
        titleLabel.text = "Speed of Speech"
        contentView.addSubview(titleLabel)
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .clear//Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
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
        
        lastVideoBLView = UIView(frame: .zero)
        lastVideoBLView.translatesAutoresizingMaskIntoConstraints = false
        //lastVideoBLView.backgroundColor = .green
        contentView.addSubview(lastVideoBLView)
            
        lastVideoBLView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(dividerView.snp.bottom)
            make.width.equalTo(contentView.frame.width/2)
            make.leading.equalTo(0)
        }
        
        if lastVideoTitleLbl == nil {
            lastVideoTitleLbl = UILabel(frame: .zero)
            lastVideoTitleLbl.translatesAutoresizingMaskIntoConstraints = false
            lastVideoTitleLbl.textColor = Palette.V2.V2_VCTitle
            lastVideoTitleLbl.text = "Last Video"
            lastVideoTitleLbl.font = LatoFont.bold.withSize(15.0)
            lastVideoTitleLbl.textAlignment = .center
            lastVideoBLView.addSubview(lastVideoTitleLbl)
            
            lastVideoTitleLbl.snp.makeConstraints { make in
                make.top.equalTo(lastVideoBLView)
                make.leading.equalTo(lastVideoBLView).offset(4*itemsMargin)
                make.trailing.equalTo(lastVideoBLView)
                make.height.equalTo(30)
            }
        }
    
        thisVideoBLView = UIView(frame: .zero)
        thisVideoBLView.translatesAutoresizingMaskIntoConstraints = false
        //thisVideoBLView.backgroundColor = .red
        contentView.addSubview(thisVideoBLView)
        
        thisVideoBLView.snp.makeConstraints { make in
            make.trailing.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(dividerView.snp.bottom)
            make.width.equalTo(contentView.frame.width/2)
        }
        
        if thisVideoTitleLbl == nil {
            thisVideoTitleLbl = UILabel(frame: .zero)
            thisVideoTitleLbl.translatesAutoresizingMaskIntoConstraints = false
            thisVideoTitleLbl.textColor = Palette.V2.V2_VCTitle
            thisVideoTitleLbl.text = "This Video"
            thisVideoTitleLbl.font = LatoFont.bold.withSize(15.0)
            thisVideoTitleLbl.textAlignment = .center
            thisVideoBLView.addSubview(thisVideoTitleLbl)
            
            thisVideoTitleLbl.snp.makeConstraints { make in
                make.top.equalTo(thisVideoBLView)
                make.leading.equalTo(thisVideoBLView)
                make.trailing.equalTo(thisVideoBLView).offset(-4*itemsMargin)
                make.height.equalTo(30)
            }
        }
        //self.gaugeViewSetUp()
       
    }
    
    private func gaugeViewSetUp() {
        gaugeView = GaugeView(frame: contentView.bounds)
        gaugeView.translatesAutoresizingMaskIntoConstraints = false
        gaugeView.backgroundColor = backgroundColor //(traitCollection.userInterfaceStyle == .light) ? UIColor.init(white: 0.9, alpha: 1) : UIColor.init(white: 0.1, alpha: 1)
        gaugeView.valueFont = UIFont(name: "Avenir-Black", size: 18) ??
            UIFont.systemFont(ofSize: 18.0, weight: .black)
        gaugeView.valueTextColor = Palette.V2.V2_pageControlIndicatorSelected
        gaugeView.unitOfMeasurement = "Words/Minute"
        gaugeView.unitOfMeasurementFont = LatoFont.regular.withSize(12.0)
        gaugeView.unitOfMeasurementTextColor = Palette.V2.V2_feedsDate
        gaugeView.showMinMaxValue = false
        gaugeView.showLimitDot = false
        gaugeView.minValue = 0
        gaugeView.maxValue = 300
        gaugeView.numOfSubDivisions = 0
        gaugeView.numOfDivisions = 0
        gaugeView.ringThickness = 15.0
        gaugeView.ringBackgroundColor = Palette.V2.V2_VCBackground
        gaugeView.needleFillColor =  Palette.V2.V2_pageControlIndicatorSelected
        lastVideoBLView.addSubview(gaugeView)
        gaugeView.snp.makeConstraints { (make) in
            make.top.equalTo(lastVideoTitleLbl.snp.bottom).offset(2)
            make.leading.equalTo(lastVideoBLView).offset(2*itemsMargin)
            make.trailing.equalTo(lastVideoBLView).offset(-2*itemsMargin)
            make.bottom.equalTo(lastVideoBLView).offset(-itemsMargin)
        }
    }
    
    private func gaugeViewSetUp1() {
        gaugeView1 = GaugeView(frame: contentView.bounds)
        gaugeView1.translatesAutoresizingMaskIntoConstraints = false
        gaugeView1.backgroundColor = backgroundColor //(traitCollection.userInterfaceStyle == .light) ? UIColor.init(white: 0.9, alpha: 1) : UIColor.init(white: 0.1, alpha: 1)
        gaugeView1.valueFont = UIFont(name: "Avenir-Black", size: 18) ??
            UIFont.systemFont(ofSize: 18.0, weight: .black)
        gaugeView1.valueTextColor = Palette.V2.V2_pageControlIndicatorSelected
        gaugeView1.unitOfMeasurement = "Words/Minute"
        gaugeView1.unitOfMeasurementFont = LatoFont.regular.withSize(12.0)
        gaugeView1.unitOfMeasurementTextColor = Palette.V2.V2_feedsDate
        gaugeView1.showMinMaxValue = false
        gaugeView1.showLimitDot = false
        gaugeView1.minValue = 0
        gaugeView1.maxValue = 300
        gaugeView1.numOfSubDivisions = 0
        gaugeView1.numOfDivisions = 0
        gaugeView1.ringThickness = 15.0
        gaugeView1.ringBackgroundColor = Palette.V2.V2_VCBackground
        gaugeView1.needleFillColor = Palette.V2.V2_pageControlIndicatorSelected
        thisVideoBLView.addSubview(gaugeView1)
        gaugeView1.snp.makeConstraints { (make) in
            make.top.equalTo(thisVideoTitleLbl.snp.bottom).offset(2)
            make.leading.equalTo(thisVideoBLView).offset(2*itemsMargin)
            make.trailing.equalTo(thisVideoBLView).offset(-2*itemsMargin)
            make.bottom.equalTo(thisVideoBLView).offset(-itemsMargin)
            //make.height.equalTo(170.0)
        }
    }
}

