//
//  AIBodyLanguageCell1.swift
//  EPICAI
//
//  Created by Abdul fattah on 03/03/22.
//

import UIKit
import Charts

class AIBodyLanguageCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var legendStackView: UIStackView!
    private var pieChartView: PieChartView!
    private var dividerView: UIView!
    
    private var lastLegendStackView: UIStackView!
    private var lastPieChartView: PieChartView!
    
    private var lastVideoBLView:UIView!
    private var thisVideoBLView:UIView!
    
    private var thisVideoTitleLbl:UILabel!
    private var lastVideoTitleLbl:UILabel!
    
    //Last Video
    var categories: [LegendCategory] = [(title: "Hand in pocket",
                                         color: Palette.V2.V2_pieChartRed,
                                         percentage: 0),
                                        (title: "Touch chin",
                                         color: Palette.V2.V2_pieChartYellow,
                                         percentage: 0),
                                        (title: "Cross arm",
                                         color: Palette.V2.V2_pieChartBlue,
                                         percentage: 0),
                                        (title: "Normal",
                                         color: Palette.V2.V2_pieChartGreen,
                                         percentage: 0)] {
        didSet {
            setupElements()
            setUpPiChart1()
        }
    }
    
    //This Video
    var categories1: [LegendCategory] = [(title: "Hand in pocket",
                                          color: Palette.V2.V2_pieChartRed,
                                          percentage: 0),
                                         (title: "Touch chin",
                                          color: Palette.V2.V2_pieChartYellow,
                                          percentage: 0),
                                         (title: "Cross arm",
                                          color: Palette.V2.V2_pieChartBlue,
                                          percentage: 0),
                                         (title: "Normal",
                                          color: Palette.V2.V2_pieChartGreen,
                                          percentage: 0)] {
        didSet {
            setupElements()
            setupElements1()
        }
    }
    
    private let itemsMargin: CGFloat = 10.0
    
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
        titleLabel.text = "Body Language"
        titleLabel.font = LatoFont.bold.withSize(19.0)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
        }
        
        dividerView = UIView(frame: .zero)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .clear//Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
        lastVideoBLView = UIView(frame: .zero)
        lastVideoBLView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lastVideoBLView)
        
        lastVideoBLView.snp.makeConstraints { make in
            make.leading.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(dividerView.snp.bottom)
            make.width.equalTo(contentView.frame.width/2)
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
                //make.centerX.equalTo(lastVideoBLView)
                //make.width.equalTo(lastVideoBLView.snp.width)
                make.leading.equalTo(lastVideoBLView).offset(2*itemsMargin)
                make.trailing.equalTo(lastVideoBLView)
                make.height.equalTo(30)
            }
        }
        
        
        thisVideoBLView = UIView(frame: .zero)
        thisVideoBLView.translatesAutoresizingMaskIntoConstraints = false
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
                make.trailing.equalTo(thisVideoBLView).offset(-2*itemsMargin)
                make.centerX.equalTo(thisVideoBLView)
                make.height.equalTo(30)
            }
        }
    }
    
    private func setUpPiChart1() {
        //Last Video
        // CREATED BY CHIA KANG YEE : 6th APRIL 2022
        // Assign dynamic elements to the pie chart
        var lvList = [LegendItemView1]()
        for cat in categories{
            let lv = LegendItemView1(item: cat)
            lvList.append(lv)
        }
        legendStackView = UIStackView(arrangedSubviews: lvList)
        
        //let v1 = LegendItemView1(item: categories[0])
        //let v2 = LegendItemView1(item: categories[1])
        //let v3 = LegendItemView1(item: categories[2])
        //let v4 = LegendItemView1(item: categories[3])
        
        //legendStackView = UIStackView(arrangedSubviews: [v1, v2, v3, v4])
        legendStackView.axis = .vertical
        legendStackView.alignment = .leading
        legendStackView.distribution = .fillProportionally
        legendStackView.spacing = 5.0
        lastVideoBLView.addSubview(legendStackView)
        legendStackView.snp.makeConstraints { (make) in
            make.top.equalTo(lastVideoTitleLbl.snp.bottom).offset(5)
            make.bottom.equalTo(lastVideoBLView.snp.bottom).offset(-10.0)
            make.leading.equalTo(lastVideoBLView.snp.leading).offset(itemsMargin)
            make.width.equalTo(60.0)
        }
        
        pieChartView = PieChartView(frame: .zero)
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        lastVideoBLView.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { (make) in
            make.top.equalTo(legendStackView)
            make.bottom.equalTo(legendStackView)
            make.leading.equalTo(legendStackView.snp.trailing).offset(10.0)
            make.trailing.equalTo(lastVideoBLView).offset(-itemsMargin)
        }
        
        let dataEntries: [ChartDataEntry] = categories.map({ PieChartDataEntry(value: $0.percentage) })
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = categories.map({ $0.color })
        pieChartDataSet.drawValuesEnabled = false
        pieChartDataSet.selectionShift = 2.0
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        pieChartView.holeRadiusPercent = 0.45
        pieChartView.holeColor = .clear
        pieChartView.legend.enabled = false
        pieChartView.transparentCircleColor = Palette.V2.V2_pieChartInnerCircle
        pieChartView.transparentCircleRadiusPercent = 0.55
    }
    
    private func setupElements1() {
        //This video
        //let lv1 = LegendItemView1(item: categories1[0])
        //let lv2 = LegendItemView1(item: categories1[1])
        //let lv3 = LegendItemView1(item: categories1[2])
        //let lv4 = LegendItemView1(item: categories1[3])
        
        // CREATED BY CHIA KANG YEE : 6th APRIL 2022
        // Assign dynamic elements to the pie chart
        var lvList = [LegendItemView1]()
        for cat in categories1{
            let lv = LegendItemView1(item: cat)
            lvList.append(lv)
        }
        lastLegendStackView = UIStackView(arrangedSubviews: lvList)
        
        //lastLegendStackView = UIStackView(arrangedSubviews: [lv1, lv2, lv3, lv4])
        lastLegendStackView.axis = .vertical
        lastLegendStackView.alignment = .leading
        lastLegendStackView.distribution = .fillProportionally
        lastLegendStackView.spacing = 5.0
        thisVideoBLView.addSubview(lastLegendStackView)
        lastLegendStackView.snp.makeConstraints { (make) in
            make.top.equalTo(thisVideoTitleLbl.snp.bottom).offset(5)
            make.bottom.equalTo(thisVideoBLView.snp.bottom).offset(-10.0)
            make.leading.equalTo(thisVideoBLView.snp.leading).offset(itemsMargin)
            make.width.equalTo(60.0)
        }
        
        lastPieChartView = PieChartView(frame: .zero)
        lastPieChartView.translatesAutoresizingMaskIntoConstraints = false
        thisVideoBLView.addSubview(lastPieChartView)
        lastPieChartView.snp.makeConstraints { (make) in
            make.top.equalTo(lastLegendStackView)
            make.bottom.equalTo(lastLegendStackView)
            make.leading.equalTo(lastLegendStackView.snp.trailing).offset(10.0)
            make.trailing.equalTo(thisVideoBLView).offset(-itemsMargin)
        }
        
        let dataEntries1: [ChartDataEntry] = categories1.map({ PieChartDataEntry(value: $0.percentage) })
        let pieChartDataSet1 = PieChartDataSet(entries: dataEntries1, label: nil)
        pieChartDataSet1.colors = categories1.map({ $0.color })
        pieChartDataSet1.drawValuesEnabled = false
        pieChartDataSet1.selectionShift = 2.0
        let pieChartData1 = PieChartData(dataSet: pieChartDataSet1)
        lastPieChartView.data = pieChartData1
        lastPieChartView.holeRadiusPercent = 0.45
        lastPieChartView.holeColor = .clear
        lastPieChartView.legend.enabled = false
        lastPieChartView.transparentCircleColor = Palette.V2.V2_pieChartInnerCircle
        lastPieChartView.transparentCircleRadiusPercent = 0.55
    }
}
