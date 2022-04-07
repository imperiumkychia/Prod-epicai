//
//  EPICAIAdvanceSettingVC.swift
//  EPICAI
//
//  Created by Abdul fattah on 18/01/22.
//

import UIKit

class EPICAIAdvanceSettingVC: UIViewController {
    
    @IBOutlet weak var optionsTV:UITableView!
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    private func leftMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        rightOptionView.addSubview(self.backButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.leftBarButtonItem = rightBaritem
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyCustomAppearance()
        self.leftMenuItems()
        self.title = "Advance settings"
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension EPICAIAdvanceSettingVC : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TourchStateCell.identifier) as! TourchStateCell
            guard let state = EPICAISharedPreference.advanceSetting?.tourchState else { return cell}
            cell.optionSwitch.isOn = state
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NoOfSecondsCell.identifier) as! NoOfSecondsCell
            switch(indexPath.row) {
            case 0: cell.seconds = 3 ; cell.hasCheckmark = (EPICAISharedPreference.advanceSetting?.poseTimerTime == 3)
            case 1: cell.seconds = 5 ; cell.hasCheckmark = (EPICAISharedPreference.advanceSetting?.poseTimerTime == 5)
            case 2: cell.seconds = 10 ;cell.hasCheckmark = (EPICAISharedPreference.advanceSetting?.poseTimerTime == 10)
            default:break
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 50.0))
        v.backgroundColor = tableView.backgroundColor
        let l = UILabel(frame: v.frame.inset(by: UIEdgeInsets(top: 15.0, left: 25, bottom: 0, right: 0)))
        l.textAlignment = .left
        l.numberOfLines = 1
        l.textColor = Palette.V2.V2_SettingsTableHeader
        l.font = LatoFont.regular.withSize(20)
        v.addSubview(l)
        
        switch section {
        case 0:
            l.text = "Countdown flash light"
            return v
        case 1:l.text = "Torch flash time"
            return v
        default:
            return nil
        }
    }
   
}

extension EPICAIAdvanceSettingVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            switch(indexPath.row) {
                case 0 : EPICAISharedPreference.advanceSetting?.poseTimerTime = 3
                case 1 : EPICAISharedPreference.advanceSetting?.poseTimerTime = 5
                case 2 : EPICAISharedPreference.advanceSetting?.poseTimerTime = 10
                default : break
            }
        }
        self.optionsTV.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
