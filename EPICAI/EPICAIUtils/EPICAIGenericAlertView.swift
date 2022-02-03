//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit

class EPICAIGenericAlertView: UIView {
    
    struct Constant {
        static let backgroundAlphaTo: CGFloat = 0.6
        static let alertEnteranceDuration: TimeInterval = 0.25
    }
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 25.0
        alert.layer.cornerCurve = .continuous
        alert.alpha = 0.0
        return alert
    }()
    
    
    private var targetView: UIView?
    
    typealias Handler = (() -> Void)
    
    private var completionHandler: Handler = {}
    
    private var title: String?
    private var message: String?
    private var buttonTitle: String?
    private var buttonBackgroundColor: UIColor?
    private var buttonTitleColor: UIColor?
    private var isShort: Bool = false

    func show(title: String,
              message: String,
              onViewController viewController: UIViewController,
              buttonTitle: String? = nil,
              buttonBackgroundColor: UIColor? = nil,
              buttonTitleColor: UIColor? = nil,
              isShort: Bool = false,
              completion: @escaping Handler) {
        
        if let nvc = viewController.tabBarController as? GenericTabBarController,
           let targetView = nvc.view {
            self.targetView = targetView
            self.completionHandler = completion
            self.title = title
            self.message = message
            self.buttonTitle = buttonTitle
            self.buttonBackgroundColor = buttonBackgroundColor
            self.buttonTitleColor = buttonTitleColor
            self.isShort = isShort
            setup()
        } else {
            self.targetView = viewController.view
            self.completionHandler = completion
            self.title = title
            self.message = message
            self.buttonTitle = buttonTitle
            self.buttonBackgroundColor = buttonBackgroundColor
            self.buttonTitleColor = buttonTitleColor
            self.isShort = isShort
            setup()
        }
    }
    
    private func setup() {
        guard let targetView = self.targetView else { return }
        self.frame = targetView.bounds
        self.backgroundColor = .black
        self.alpha = 0.0
        targetView.addSubview(self)
        
        var padding: CGFloat = 30.0
        var height: CGFloat = isShort ? round(targetView.bounds.height * 0.3) : round(targetView.bounds.height * 0.4)
        
        switch UIDevice.current.orientation {
        case .landscapeLeft, .landscapeRight:
            padding = 100.0
            height = round(targetView.bounds.height * 0.7)
        default:
            break
        }
        
        alertView.frame = CGRect(x: padding,
                                 y: -height,
                                 width: targetView.frame.size.width - (2 * padding),
                                 height: height)
        alertView.center = self.center
        alertView.transform = alertView.transform.scaledBy(x: 0.0, y: 0.0)
        // Title
        var tHeight: CGFloat = 50.0
        if self.title == nil || self.title == "" {
            tHeight = 1.0
        }
        let titleLabel = GenericAlertLabel(frame: CGRect(x: 0.0,
                                               y: 20.0,
                                               width: alertView.bounds.width,
                                               height: tHeight))
        titleLabel.textAlignment = .center
        titleLabel.font = LatoFont.regular.withSize(20.0)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        alertView.addSubview(titleLabel)
        
        // Message
        let messageLabel = GenericAlertLabel(frame: CGRect(x: 0.0,
                                                 y: titleLabel.bounds.height,
                                               width: alertView.bounds.width,
                                               height: round(0.56 * height)))
        messageLabel.textAlignment = .center
        messageLabel.font = LatoFont.regular.withSize(17.0)
        messageLabel.textColor = .darkGray
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.drawText(in: messageLabel.bounds.inset(by: UIEdgeInsets(top: 0.0, left: 15.0, bottom: 0.0, right: 15.0)))

        alertView.addSubview(messageLabel)
        
        let buttonWidth: CGFloat = 0.5 * alertView.bounds.width
        let buttonHeight: CGFloat = 50.0
        let button = UIButton(frame: CGRect(x: (alertView.bounds.width - buttonWidth) / 2.0,
                                            y: alertView.bounds.height - buttonHeight - 20.0,
                                            width: buttonWidth,
                                            height: buttonHeight))
        button.setTitle(self.buttonTitle ?? "Ok", for: .normal)
        button.addTarget(self,
                         action: #selector(dismiss),
                         for: .touchUpInside)
        button.backgroundColor = self.buttonBackgroundColor ?? Palette.V2.V2_alertButtonBackgroundBlue
        button.setTitleColor(self.buttonTitleColor ?? .white, for: .normal)
        button.titleLabel?.font = LatoFont.bold.withSize(16.0)
        button.layer.cornerRadius = button.bounds.height / 2.0
        button.layer.cornerCurve = .continuous
        alertView.addSubview(button)
        
        targetView.addSubview(alertView)

        UIView.animate(withDuration: Constant.alertEnteranceDuration) { [weak self] in
            self?.alpha = Constant.backgroundAlphaTo
        } completion: { [weak self] done in
            if done {
                UIView.animate(withDuration: Constant.alertEnteranceDuration) {
                    //self?.alertView.center = targetView.center
                    self?.alertView.transform = CGAffineTransform.identity
                    self?.alertView.alpha = 1.0
                }
            }
        }
    }
    
    @objc func dismiss() {
        //guard let targetView = targetView else { return }
        UIView.animate(withDuration: Constant.alertEnteranceDuration) { [weak self] in
            self?.alertView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self?.alertView.alpha = 0.0

        } completion: { [weak self] done in
            if done {
                UIView.animate(withDuration: Constant.alertEnteranceDuration) {
                    self?.alpha = 0.0
                } completion: { done in
                    if done {
                        self?.alertView.removeFromSuperview()
                        self?.removeFromSuperview()
                        self?.completionHandler()
                    }
                }
            }
        }
    }
}

class GenericAlertLabel: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0.0, left: 25.0, bottom: 0.0, right: 25.0)
        super.drawText(in: rect.inset(by: insets))
    }
}
