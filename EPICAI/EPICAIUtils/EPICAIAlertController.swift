//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import CDAlertView

class EPICAIAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor.systemRed
    }
}

class AlertUser {
    
    static func alertUser(title: String, message: String, type: CDAlertViewType) {
        let alert = CDAlertView(title: title, message: message, type: type)
        alert.alertBackgroundColor = .white
        alert.titleFont = LatoFont.bold.withSize(17.0)
        alert.messageFont = LatoFont.regular.withSize(17.0)
        alert.actionSeparatorColor = alert.alertBackgroundColor
        let doneAction = CDAlertViewAction(title: "Ok")
        switch type {
        case .success:
            alert.circleFillColor = Palette.darkPurple
            doneAction.buttonTextColor = Palette.darkPurple
            doneAction.buttonBackgroundColor = .systemOrange
        case .error:
            alert.circleFillColor = Palette.pink
            doneAction.buttonTextColor = Palette.pink
        default:
            alert.circleFillColor = Palette.darkPurple
            doneAction.buttonTextColor = Palette.darkPurple
        }
        alert.add(action: doneAction)
        alert.show()
    }
    
    static func alertUser(title: String, message: String, target: UIViewController) {
        let alertController = EPICAIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { (alert) in
            /// Do nothing
        }
        alertController.addAction(okAction)
        alertController.popoverPresentationController?.sourceView = target.view
        target.present(alertController, animated: true, completion: nil)
    }
    
}

