//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//


import UIKit
import LGButton
import SnapKit

protocol FloatingBarViewDelegate: AnyObject {
    func did(selectindex: Int)
}

class FloatingBarView: UIView {

    weak var delegate: FloatingBarViewDelegate?

    var buttons: [LGButton] = []
    var titles: [String] = []
    var images: [String] = []

    init(images: [String], titles: [String]) {
        super.init(frame: .zero)
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.titles = titles
        self.images = images
        setupStackView(images)
        updateUI(selectedIndex: 0)
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.height / 2
        layer.cornerCurve = .continuous

        layer.shadowPath = UIBezierPath(rect: bounds.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))).cgPath
        layer.shadowColor = Palette.V2.V2_VCTitle.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 20.0
    }

    func setupStackView(_ items: [String]) {
        for (index, item) in items.enumerated() {
            let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .medium)
            let normalImage = UIImage(named: "\(item)_unselected", in: nil, with: symbolConfig)
            let selectedImage = UIImage(named: "\(item)_selected", in: nil, with: symbolConfig)
            let button = createButton(normalImage: normalImage!, selectedImage: selectedImage!, index: index)
            buttons.append(button)
        }

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 25.0
        stackView.distribution = .equalCentering
        stackView.alignment = .center

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 2.0, left: 5.0, bottom: 2.0, right: 5.0))
    }

    func createButton(normalImage: UIImage, selectedImage: UIImage, index: Int) -> LGButton {
        let button = LGButton()
        button.bgColor = self.backgroundColor!
        button.titleFontName = LatoFont.Names.regular
        button.titleFontSize = 15.0
        button.titleNumOfLines = 1
        button.spacingTitleIcon = 10.0
        button.leftImageWidth = 20.0
        button.leftImageHeight = 20.0
        button.constrainHeight(constant: 46.0)
        button.cornerRadius = 23.0
        button.layer.cornerCurve = .continuous
        button.tag = index
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }

    @objc
    func changeTab(_ sender: UIButton) {
        sender.pulse()
        delegate?.did(selectindex: sender.tag)
        updateUI(selectedIndex: sender.tag)
    }

    func changeTab(toIndex index: Int) {
        delegate?.did(selectindex: index)
        updateUI(selectedIndex: index)
    }
    
    func updateUI(selectedIndex: Int) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                button.bgColor = Palette.V2.V2_tabBarItemBackground
                button.titleString = titles[index]
                button.leftImageSrc = UIImage(named: "\(images[index])_selected")
            } else {
                button.isSelected = false
                button.bgColor = self.backgroundColor!
                button.titleString = ""
                button.leftImageSrc = UIImage(named: "\(images[index])_unselected")
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func toggle(hide: Bool) {
        if !hide {
            isHidden = hide
        }

        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = hide ? 0 : 1
            self.transform = hide ? CGAffineTransform(translationX: 0, y: 10) : .identity
        }) { (_) in
            if hide {
                self.isHidden = hide
            }
        }
    }
}

extension UIButton {

    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.15
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        layer.add(pulse, forKey: "pulse")
    }
}
