//
//  VideoTonalityCell.swift
//  EPICAI
//
//  Created by Pouya Khansaryan on 15/06/21.
//  Copyright © 2021 Pouya Kh. All rights reserved.
//


import Foundation
import SnapKit
import Charts

class VideoTonalityCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var dividerView: UIView!
    private var barChartView: BarChartView!
    private var infoStackView: UIStackView!
    private var maxView: TonalityInfoItemView!
    private var minView: TonalityInfoItemView!
    private var avgView: TonalityInfoItemView!

    var data: [Double] = [] {
        didSet {
            if !data.isEmpty { updateValues() }
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
        
        maxView = TonalityInfoItemView(title: "Max Decibel",value: CGFloat(data.max() ?? 0.0))
        minView = TonalityInfoItemView(title: "Min Decibel",value: CGFloat(data.min() ?? 0.0))
        let avg = CGFloat(data.sum() / Double(data.count))
        avgView = TonalityInfoItemView(title: "Average Decibel",value: avg)
        
        infoStackView = UIStackView(arrangedSubviews: [maxView, minView, avgView])
        infoStackView.axis = .horizontal
        infoStackView.alignment = .center
        infoStackView.distribution = .equalCentering
        infoStackView.spacing = 15.0
        contentView.addSubview(infoStackView)
        infoStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(dividerView.snp.top)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
            make.height.equalTo(60.0)
        }
        
        barChartView = BarChartView(frame: .zero)
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(barChartView)
        barChartView.snp.makeConstraints { (make) in
            make.leading.equalTo(infoStackView)
            make.trailing.equalTo(infoStackView)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(infoStackView.snp.top)
        }
        
        let entries = [BarChartDataEntry]()
        let set = BarChartDataSet(entries: entries, label: nil)
        set.colors = [Palette.V2.V2_feedsDate]
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        
        let chartData = BarChartData(dataSet: set)
        chartData.barWidth = 0.4
        
        barChartView.data = chartData
        barChartView.isUserInteractionEnabled = false
        barChartView.legend.enabled = false
        barChartView.drawBordersEnabled = false
        barChartView.drawValueAboveBarEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawGridBackgroundEnabled = false
        barChartView.leftAxis.enabled = false
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.enabled = false
        barChartView.renderer = PieCharRoundedCornerRenderer(dataProvider: barChartView,
                                                             animator: barChartView.chartAnimator,
                                                             viewPortHandler: barChartView.viewPortHandler,
                                                             cornerRadius: 4.0,
                                                             excludeBaseCorners: true)
    }
    
    private func updateValues() {
        maxView.value = CGFloat(data.max() ?? 0.0)
        minView.value = CGFloat(data.min() ?? 0.0)
        let avg = CGFloat(data.sum() / Double(data.count))
        avgView.value = avg
        
        var entries = [BarChartDataEntry]()
        for (i, v) in data.enumerated() {
            entries.append(BarChartDataEntry(x: Double(i), y: v / 2.0))
            entries.append(BarChartDataEntry(x: Double(i), y: -v / 2.0))
        }
        
        let set = BarChartDataSet(entries: entries, label: nil)
        set.colors = [Palette.V2.V2_feedsDate]
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        
        let chartData = BarChartData(dataSet: set)
        chartData.barWidth = 0.4
        barChartView.data = chartData
    }
}

