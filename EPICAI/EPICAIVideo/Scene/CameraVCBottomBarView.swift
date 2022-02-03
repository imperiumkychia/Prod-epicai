//
//  EPICAIVideoCapture.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import SnapKit

class CameraVCBottomBarView: UIView {

    var leftButton: UIButton!
    var centerButton: UIButton!
    var rightButton: UIButton!
    
    private var baseLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        baseLayer.fillColor = Palette.V2.V2_cameraBottomSideBackground.withAlphaComponent(0.6).cgColor
    }
    
    private func configure() {
        backgroundColor = .clear
        
        /// Create base layer
        let indent: CGFloat = 5.0
        let spacing: CGFloat = 0.0
        let hh = frame.height / 2.0
        let hhh = hh - (indent)
        
        let roundedRectFrame = CGRect(x: indent, y: indent, width: frame.width - 2 * indent, height: hhh * 2.0)
        let dummyView = UIView(frame: roundedRectFrame)
        dummyView.backgroundColor = backgroundColor
        dummyView.clipsToBounds = true
        //dummyView.alpha = 0.6
        addSubview(dummyView)
        
        baseLayer = CAShapeLayer()
        
        let sidePath = UIBezierPath(roundedRect: roundedRectFrame.applying(.init(translationX: -roundedRectFrame.origin.x, y: -roundedRectFrame.origin.y)), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: hhh, height: hhh))
            
            
        sidePath.append(UIBezierPath(arcCenter: center.applying(.init(translationX: -roundedRectFrame.origin.x, y: -roundedRectFrame.origin.y)), radius: hh + spacing, startAngle: 0.0, endAngle: 2.0 * .pi, clockwise: true).reversing())
        
        sidePath.usesEvenOddFillRule = true
        
        Palette.V2.V2_cameraBottomSideBackground.setFill()
        
        baseLayer.path = sidePath.cgPath
        baseLayer.fillColor = Palette.V2.V2_cameraBottomSideBackground.withAlphaComponent(0.6).cgColor
        dummyView.layer.addSublayer(baseLayer)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.3
        
        /// Create buttons
        centerButton = UIButton(frame: .zero)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.layer.cornerRadius = hh
        centerButton.backgroundColor = Palette.V2.V2_cameraBottomCenterButtonBackground
        centerButton.setImage(#imageLiteral(resourceName: "startRecord"), for: .normal)
        centerButton.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        addSubview(centerButton)
        centerButton.snp.makeConstraints { (make) in
            make.width.equalTo(hh * 2.0)
            make.height.equalTo(hh * 2.0)
            make.center.equalTo(self)
        }
        
        let sideButtonWidth: CGFloat = 40.0
        let sideButtonShift: CGFloat = 40.0
        
        leftButton = UIButton(frame: .zero)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setImage(#imageLiteral(resourceName: "galery"), for: .normal)
        leftButton.imageEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        leftButton.backgroundColor = Palette.V2.V2_cameraVCSwitchUnselectedBackground
        leftButton.tintColor = .white
        leftButton.layer.cornerRadius = 20
        addSubview(leftButton)
        leftButton.snp.makeConstraints { (make) in
            make.width.equalTo(sideButtonWidth)
            make.height.equalTo(sideButtonWidth)
            make.centerY.equalTo(self)
            make.leading.equalTo(dummyView.frame.minX + sideButtonShift)
        }
        
        rightButton = UIButton(frame: .zero)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setImage(#imageLiteral(resourceName: "revCamera").withRenderingMode(.alwaysTemplate), for: .normal)
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        rightButton.backgroundColor = Palette.V2.V2_cameraVCSwitchUnselectedBackground
        rightButton.tintColor = .white
        rightButton.layer.cornerRadius = 20
        addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.width.equalTo(sideButtonWidth)
            make.height.equalTo(sideButtonWidth)
            make.centerY.equalTo(self)
            make.leading.equalTo(dummyView.frame.maxX - sideButtonShift - sideButtonWidth)
        }
    }
}
