//
//  APICAIUser.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import Foundation
import SnapKit
import Charts

class ProfileOverviewCell: UITableViewCell {
    
    private var titleLabel: UILabel!
    private var barChartView: BarChartView!
    private var scoreLabel: UILabel!
    private var dividerView: UIView!
    
    var data: [Double] = [] {
        didSet {
            if !data.isEmpty { configureUI() }
        }
    }
    
    var score: CGFloat = 0.0 {
        didSet {
            scoreLabel.text = String(format: "Score over videos: %.1f", score)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = Palette.V2.V2_VCBackground
        contentView.backgroundColor = backgroundColor
        
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
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = Palette.V2.V2_VCTitle
        titleLabel.font = LatoFont.bold.withSize(18.0)
        titleLabel.textAlignment = .center
        titleLabel.text = "Overview"
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(20.0)
            make.centerX.equalTo(contentView)
        }
        
        scoreLabel = UILabel(frame: .zero)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textColor = Palette.V2.V2_VCTitle
        scoreLabel.font = LatoFont.regular.withSize(12.0)
        scoreLabel.textAlignment = .center
        contentView.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(dividerView.snp.top).offset(-20.0)
            make.centerX.equalTo(contentView)
        }
        
        barChartView = BarChartView(frame: .zero)
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(barChartView)
        barChartView.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView).offset(45.0)
            make.trailing.equalTo(contentView).offset(-45.0)
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(scoreLabel.snp.top).offset(-20.0)
        }
        
        var entries = [BarChartDataEntry]()
        for (i, v) in data.enumerated() {
            entries.append(BarChartDataEntry(x: Double(i), y: v))
        }
        
        let set = BarChartDataSet(entries: entries, label: nil)
        set.colors = [Palette.V2.V2_pieChartGreen]
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        
        let chartData = BarChartData(dataSet: set)
        //chartData.barWidth = 0.4
        
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
                                                             cornerRadius: 10.0,
                                                             excludeBaseCorners: false)
    }
}

