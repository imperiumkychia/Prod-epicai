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

class FeedsTonalityCell: FSPagerViewCell {
        
    private var titleLabel: UILabel!
    private var barChartView: BarChartView!
    private var infoStackView: UIStackView!
    private var maxView: TonalityInfoItemView!
    private var minView: TonalityInfoItemView!
    private var avgView: TonalityInfoItemView!

    var data: [Double] = [] {
        didSet {
            if !data.isEmpty { configureUI() }
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
        titleLabel.text = "Tonality"
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
        }
        
        maxView = TonalityInfoItemView(title: "Max Decibel",value: CGFloat(data.max() ?? 0.0))
        minView = TonalityInfoItemView(title: "Min Decibel",value: CGFloat(data.min() ?? 0.0))
        avgView = TonalityInfoItemView(title: "Average Decibel",value: CGFloat(data.sum() / Double(data.count)))
        
        infoStackView = UIStackView(arrangedSubviews: [maxView, minView, avgView])
        infoStackView.axis = .horizontal
        infoStackView.alignment = .center
        infoStackView.distribution = .equalCentering
        infoStackView.spacing = 15.0
        contentView.addSubview(infoStackView)
        infoStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.equalTo(60.0)
        }
        
        
        barChartView = BarChartView(frame: .zero)
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(barChartView)
        barChartView.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(infoStackView.snp.top)
        }
        
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
        
        barChartView.isUserInteractionEnabled = false
        barChartView.data = chartData
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
    
    
}


class TonalityInfoItemView: UIView {
    
    var value: CGFloat = 0.0 {
        didSet {
            valueLabel.text = String(format: "%.1f", value)
        }
    }
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private var titleLabel: UILabel!
    private var valueLabel: UILabel!
    
    init(title: String, value: CGFloat) {
        super.init(frame: .zero)
        self.title = title
        self.value = value
        configureUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_tonalityLegendTitle.withAlphaComponent(0.7)
        titleLabel.font = LatoFont.regular.withSize(11.0)
        titleLabel.textAlignment = .left
        titleLabel.text = self.title
        addSubview(titleLabel)
        
        valueLabel = UILabel(frame: .zero)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textColor = Palette.V2.V2_tonalityLegendTitle
        valueLabel.font = LatoFont.bold.withSize(26.0)
        valueLabel.textAlignment = .left
        valueLabel.text = String(format: "%.1f", self.value)
        addSubview(valueLabel)
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(100.0)
            make.height.equalTo(60.0)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(self)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self)
            make.trailing.equalTo(self)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(self)
        }
    }
}

extension Sequence where Element: AdditiveArithmetic {
    /// Returns the total sum of all elements in the sequence
    func sum() -> Element { reduce(.zero, +) }
}
