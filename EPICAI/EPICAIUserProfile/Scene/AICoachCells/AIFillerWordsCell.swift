//
//  AIFillerWordsCell.swift
//  EPICAI
//
//  Created by Abdul fattah on 02/03/22.
//

import UIKit

class AIFillerWordsCell: UITableViewCell {
    
    private var titleLabel:UILabel!
    private var dividerView:UIView!
    
    private var lastVideoBLView:UIView!
    private var thisVideoBLView:UIView!
    
    private var thisVideoTitleLbl:UILabel!
    private var lastVideoTitleLbl:UILabel!
    
    private var infoStackView: UIStackView!
    private var infoStackView1: UIStackView!
    
    private let itemsMargin: CGFloat = 10.0
    
    var data: [FillerWordType] = [] {
        didSet {
            setupElements()
        }
    }
    
    var data1: [FillerWordType] = [] {
        didSet {
            setupElements()
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
        titleLabel.text = "Filler Words"
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
        
        var views = [FillerWrodItemView]()
        
        for item in data {
            views.append(FillerWrodItemView(title: item.title, color: item.color, value: item.value))
        }
        
        infoStackView = UIStackView(arrangedSubviews: views)
        infoStackView.axis = .vertical
        infoStackView.alignment = .center
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = 5.0
        lastVideoBLView.addSubview(infoStackView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(itemsMargin)
            make.centerX.equalTo(contentView)
        }
        
        dividerView.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.bottom.equalTo(contentView)
            make.leading.equalTo(contentView).offset(itemsMargin)
            make.trailing.equalTo(contentView).offset(-itemsMargin)
        }
        
        infoStackView.snp.makeConstraints { (make) in
            make.bottom.equalTo(lastVideoBLView).offset(-itemsMargin)
            make.leading.equalTo(lastVideoBLView)
            make.trailing.equalTo(lastVideoBLView)
            make.top.equalTo(lastVideoTitleLbl.snp.bottom).offset(itemsMargin)
        }
        
        
        // This
        
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
        
        var views1 = [FillerWrodItemView]()
        
        for item in data1 {
            views1.append(FillerWrodItemView(title: item.title, color: item.color, value: item.value))
        }
        
        infoStackView1 = UIStackView(arrangedSubviews: views1)
        infoStackView1.axis = .vertical
        infoStackView1.alignment = .center
        infoStackView1.distribution = .fillProportionally
        infoStackView1.spacing = 5.0
        thisVideoBLView.addSubview(infoStackView1)
        
        infoStackView1.snp.makeConstraints { (make) in
            make.bottom.equalTo(thisVideoBLView).offset(-itemsMargin)
            make.leading.equalTo(thisVideoBLView)
            make.trailing.equalTo(thisVideoBLView)
            make.top.equalTo(thisVideoTitleLbl.snp.bottom).offset(itemsMargin)
        }
    }
}
