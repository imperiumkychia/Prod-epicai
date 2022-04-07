//
//  AITonalityCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 02/03/22.
//

import UIKit
import Charts

class AITonalityCell: UITableViewCell {
    
    private var titleLabel:UILabel!
    private var dividerView:UIView!
    
    private var lastVideoBLView:UIView!
    private var thisVideoBLView:UIView!
    
    private var thisVideoTitleLbl:UILabel!
    private var lastVideoTitleLbl:UILabel!
    
    private var barChartView: BarChartView!
    private var infoStackView: UIStackView!
    private var maxView: TonalityInfoItemView!
    private var minView: TonalityInfoItemView!
    private var avgView: TonalityInfoItemView!
    
    private var barChartView1: BarChartView!
    private var infoStackView1: UIStackView!
    private var maxView1: TonalityInfoItemView!
    private var minView1: TonalityInfoItemView!
    private var avgView1: TonalityInfoItemView!
    
    private let itemsMargin: CGFloat = 7.0
    
    var lastVideoTonalityResult:TonalityResult?
    var thisVideoTonalityResult:TonalityResult?

    
    var data: [Double] = [] {
        didSet {
            self.setupElements()
            if !data.isEmpty { updateValues() }
        }
    }
    
    var data1: [Double] = [] {
        didSet {
            //self.setupElements()
            if !data1.isEmpty { updateValues1() }
        }
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupElements()
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
        titleLabel.text = "Tonality"
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
        
        //if lastVideoBLView == nil {
            lastVideoBLView = UIView(frame: .zero)
            lastVideoBLView.translatesAutoresizingMaskIntoConstraints = false
            //lastVideoBLView.backgroundColor = .green
            contentView.addSubview(lastVideoBLView)
            
            lastVideoBLView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(itemsMargin)
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
                    make.leading.equalTo(lastVideoBLView)
                    make.trailing.equalTo(lastVideoBLView)
                    make.height.equalTo(30)
                }
            }
            
            //Last Video
            maxView = TonalityInfoItemView(title: "Max Dcbl",value:  CGFloat(data.max() ?? 0.0))
            minView = TonalityInfoItemView(title: "Min Dcbl",value: CGFloat(data.min() ?? 0.0))
            var avg = 0.0
            if data.sum() != 0.0  && data.count > 0 {
                avg = CGFloat(data.sum() / Double(data.count))
            } else {
                avg = 0.0
            }
        
            avgView = TonalityInfoItemView(title: "Avg Dcbl",value: avg)
            
            infoStackView = UIStackView(arrangedSubviews: [maxView, minView, avgView])
            infoStackView.axis = .horizontal
            infoStackView.alignment = .leading
            infoStackView.distribution = .fillEqually
            infoStackView.spacing = 1.0
            lastVideoBLView.addSubview(infoStackView)
            infoStackView.snp.makeConstraints { (make) in
                make.bottom.equalTo(lastVideoBLView)
                make.leading.equalTo(lastVideoBLView).offset(2*itemsMargin)
                make.trailing.equalTo(lastVideoBLView).offset(-itemsMargin)
                make.height.equalTo(60.0)
            }
            
            barChartView = BarChartView(frame: .zero)
            barChartView.translatesAutoresizingMaskIntoConstraints = false
            lastVideoBLView.addSubview(barChartView)
            barChartView.snp.makeConstraints { (make) in
                make.leading.equalTo(lastVideoBLView).offset(itemsMargin)
                make.top.equalTo(lastVideoTitleLbl.snp.bottom)
                make.bottom.equalTo(infoStackView.snp.top)
                make.trailing.equalTo(lastVideoBLView).offset(-itemsMargin)
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
        //}
        
       // if thisVideoBLView == nil {
            thisVideoBLView = UIView(frame: .zero)
            thisVideoBLView.translatesAutoresizingMaskIntoConstraints = false
            //thisVideoBLView.backgroundColor = .red
            contentView.addSubview(thisVideoBLView)
            
            thisVideoBLView.snp.makeConstraints { make in
                make.trailing.equalTo(0)
                make.top.equalTo(titleLabel.snp.bottom).offset(itemsMargin)
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
                    make.trailing.equalTo(thisVideoBLView)
                    make.height.equalTo(30)
                }
            }
            
            //This Video
            maxView1 = TonalityInfoItemView(title: "Max Dcbl",value: CGFloat(data1.max() ?? 0.0))
            minView1 = TonalityInfoItemView(title: "Min Dcbl",value: CGFloat(data1.min() ?? 0.0))
            let avg1 = CGFloat(data1.sum() / Double(data1.count))
            avgView1 = TonalityInfoItemView(title: "Avg Dcbl",value: avg1)
            
            infoStackView1 = UIStackView(arrangedSubviews: [maxView1, minView1, avgView1])
            infoStackView1.axis = .horizontal
            infoStackView1.alignment = .leading
            infoStackView1.distribution = .fillEqually
            infoStackView1.spacing = 1.0
            thisVideoBLView.addSubview(infoStackView1)
            infoStackView1.snp.makeConstraints { (make) in
                make.bottom.equalTo(thisVideoBLView)
                make.leading.equalTo(thisVideoBLView).offset(2*itemsMargin)
                make.trailing.equalTo(thisVideoBLView).offset(-itemsMargin)
                make.height.equalTo(60.0)
            }
            barChartView1 = BarChartView(frame: .zero)
            barChartView1.translatesAutoresizingMaskIntoConstraints = false
            thisVideoBLView.addSubview(barChartView1)
            barChartView1.snp.makeConstraints { (make) in
                make.trailing.equalTo(thisVideoBLView).offset(-itemsMargin)
                make.top.equalTo(thisVideoTitleLbl.snp.bottom)
                make.bottom.equalTo(infoStackView1.snp.top)
                make.leading.equalTo(thisVideoBLView).offset(itemsMargin)
            }
            
            let entries1 = [BarChartDataEntry]()
            let set1 = BarChartDataSet(entries: entries1, label: nil)
            set1.colors = [Palette.V2.V2_feedsDate]
            set1.drawValuesEnabled = false
            set1.highlightEnabled = false
            
            let chartData1 = BarChartData(dataSet: set1)
            chartData1.barWidth = 0.4
            
            barChartView1.data = chartData1
            barChartView1.isUserInteractionEnabled = false
            barChartView1.legend.enabled = false
            barChartView1.drawBordersEnabled = false
            barChartView1.drawValueAboveBarEnabled = false
            barChartView1.drawBarShadowEnabled = false
            barChartView1.drawGridBackgroundEnabled = false
            barChartView1.leftAxis.enabled = false
            barChartView1.rightAxis.enabled = false
            barChartView1.xAxis.enabled = false
            barChartView1.renderer = PieCharRoundedCornerRenderer(dataProvider: barChartView1,
                                                                  animator: barChartView1.chartAnimator,
                                                                  viewPortHandler: barChartView1.viewPortHandler,
                                                                  cornerRadius: 4.0,
                                                                  excludeBaseCorners: true)
       // }
    }
    
    private func updateValues() {
        maxView.value = self.lastVideoTonalityResult?.maxDecibel ?? 0.0
        minView.value = self.lastVideoTonalityResult?.minDecibel ?? 0.0
        //let avg = CGFloat(data.sum() / Double(data.count))
        avgView.value = self.lastVideoTonalityResult?.averageDecibel ?? 0.0
        
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
    
    private func updateValues1() {
        maxView1.value = self.thisVideoTonalityResult?.maxDecibel ?? 0.0
        minView1.value = self.thisVideoTonalityResult?.minDecibel ?? 0.0
        //let avg = CGFloat(data1.sum() / Double(data1.count))
        avgView1.value = self.thisVideoTonalityResult?.averageDecibel ?? 0.0
        
        var entries = [BarChartDataEntry]()
        for (i, v) in data1.enumerated() {
            entries.append(BarChartDataEntry(x: Double(i), y: v / 2.0))
            entries.append(BarChartDataEntry(x: Double(i), y: -v / 2.0))
        }
        
        let set = BarChartDataSet(entries: entries, label: nil)
        set.colors = [Palette.V2.V2_feedsDate]
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        
        let chartData = BarChartData(dataSet: set)
        chartData.barWidth = 0.4
        barChartView1.data = chartData
    }
    
}
