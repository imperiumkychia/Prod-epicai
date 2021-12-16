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

class FeedsPieChartCell: FSPagerViewCell {
        
    private var legendStackView: UIStackView!
    private var pieChartView: PieChartView!
    
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
            configureUI()
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
        
        let v1 = LegendItemView(item: categories[0])
        let v2 = LegendItemView(item: categories[1])
        let v3 = LegendItemView(item: categories[2])
        let v4 = LegendItemView(item: categories[3])
        
        legendStackView = UIStackView(arrangedSubviews: [v1, v2, v3, v4])
        legendStackView.axis = .vertical
        legendStackView.alignment = .leading
        legendStackView.distribution = .fillProportionally
        legendStackView.spacing = 15.0
        contentView.addSubview(legendStackView)
        legendStackView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(5.0)
            make.bottom.equalTo(contentView).offset(-5.0)
            make.leading.equalTo(contentView)
            make.width.equalTo(100.0)
        }
        
        
        pieChartView = PieChartView(frame: .zero)
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(legendStackView.snp.trailing).offset(40.0)
            make.trailing.equalTo(contentView).offset(-20.0)
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
    
    @objc private func secondaryButtonTapped(_ sender: UIButton) {
        
    }
}

typealias LegendCategory = (title: String, color: UIColor, percentage: Double)

class LegendItemView: UIView {
    
    var item: LegendCategory = LegendCategory(title: "ABC", color: UIColor.systemBlue, percentage: 0.0)
    
    private var stackView: UIStackView!
    private var colorView: UIView!
    private var numberLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    
    required init(item: LegendCategory) {
        super.init(frame: .zero)
        self.item = item
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
        colorView.layer.cornerRadius = 18.0
        colorView.layer.cornerCurve = .continuous
        colorView.backgroundColor = item.color
        colorView.snp.makeConstraints { (make) in
            make.height.equalTo(colorView.layer.cornerRadius * 2.0)
            make.width.equalTo(60.0)
        }
        
        numberLabel = UILabel(frame: .zero)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.text = "%\(round(item.percentage))"
        numberLabel.textAlignment = .center
        numberLabel.numberOfLines = 1
        numberLabel.textColor = Palette.V2.V2_pieChartLegendLabel
        numberLabel.font = LatoFont.regular.withSize(16.0)
        numberLabel.backgroundColor = .clear
        colorView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(colorView)
        }

        descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .clear
        descriptionLabel.text = item.title
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = Palette.V2.V2_pieChartLegendDescription
        descriptionLabel.font = LatoFont.regular.withSize(12.0)
        descriptionLabel.snp.makeConstraints { (make) in
            make.width.equalTo(55.0)
        }
        
        stackView = UIStackView(arrangedSubviews: [colorView, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 13.0
        addSubview(stackView)
        
    }
}
