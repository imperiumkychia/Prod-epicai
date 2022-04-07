//
//  CustomSegmentControl.swift
//  Daam
//
//  Created by Abdul on 03/09/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

class CustomSegmentControl: UIView {

    var buttonBar:UIView!
    var segmentedControl:UISegmentedControl!
    var segmentSelectIndex : ((UISegmentedControl?) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Container view
        //let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width , height: frame.height))
        self.backgroundColor = (traitCollection.userInterfaceStyle == .light) ?  UIColor.init(white: 0.95, alpha: 1) : UIColor.init(white: 0.05, alpha: 1)
        
        segmentedControl = UISegmentedControl()
        
        // Add segments
        //segmentedControl.insertSegment(withTitle: "Report", at: 0, animated: true)
        //segmentedControl.insertSegment(withTitle: "AI Coach", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "AI Coach", at: 0, animated: true)
        
        //segmentedControl.setWidth(self.frame.size.width/2, forSegmentAt: 0)
        //segmentedControl.setWidth(self.frame.size.width/2, forSegmentAt: 1)
        segmentedControl.setWidth(self.frame.size.width, forSegmentAt: 0)
    
        // First segment is selected by default
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .clear
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ], for: .normal)
        
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: Palette.V2.V2_VCTitle
            ], for: .selected)
        
        // This needs to be false since we are using auto layout constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        
        buttonBar = UIView()
        // This needs to be false since we are using auto layout constraints
        buttonBar.translatesAutoresizingMaskIntoConstraints = false
        buttonBar.backgroundColor = Palette.V2.V2_VCTitle
        
        // Add the segmented control to the container view
        self.addSubview(segmentedControl)
        self.addSubview(buttonBar)
        
//        let sepraterView = UIView(frame: CGRect(x: 0, y: 5, width: 1, height: self.frame.height-10))
//        sepraterView.backgroundColor = DesignConstant.NavBarColor
//        self.addSubview(sepraterView)
//        sepraterView.center = self.center
        
        // Constrain the segmented control to the top of the container view
        segmentedControl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        // Constrain the segmented control width to be equal to the container view width
        segmentedControl.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        // Constrain the height of the segmented control to an arbitrarily chosen value
        segmentedControl.heightAnchor.constraint(equalToConstant: self.frame.height - 1).isActive = true
        
        // Constrain the top of the button bar to the bottom of the segmented control
        buttonBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        buttonBar.heightAnchor.constraint(equalToConstant: 1).isActive = true
        // Constrain the button bar to the left side of the segmented control
        buttonBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        // Constrain the button bar to the width of the segmented control divided by the number of segments
        buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1).isActive = true
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.buttonBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
        }
        guard let letSegmentAction = self.segmentSelectIndex else {
            return
        }
        letSegmentAction(sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
