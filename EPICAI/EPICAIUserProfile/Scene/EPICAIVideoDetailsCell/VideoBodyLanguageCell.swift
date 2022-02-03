//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import Foundation
import Charts

class VideoBodyLanguageCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var legendStackView: UIStackView!
    private var pieChartView: PieChartView!
    private var dividerView: UIView!

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
        dividerView.backgroundColor = Palette.V2.V2_profileTableDivider
        contentView.addSubview(dividerView)
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20.0)
            make.trailing.equalTo(contentView).offset(-20.0)
        }
        
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
            make.top.equalTo(titleLabel.snp.bottom).offset(itemsMargin)
            make.bottom.equalTo(dividerView.snp.top).offset(-10.0)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.width.equalTo(100.0)
        }
        
        
        pieChartView = PieChartView(frame: .zero)
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { (make) in
            make.top.equalTo(legendStackView)
            make.bottom.equalTo(legendStackView)
            make.leading.equalTo(legendStackView.snp.trailing).offset(40.0)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
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
    
    
}
