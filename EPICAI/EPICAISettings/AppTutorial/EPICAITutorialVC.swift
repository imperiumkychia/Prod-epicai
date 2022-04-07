//
//  EPICAITutorialVC.swift
//  TutorialAPP
//
//  Created by Abdul fattah on 26/02/22.
//

import UIKit

class EPICAITutorialVC: UIViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var swipeableView:UIView!
    @IBOutlet weak var pager:UIPageControl!
    @IBOutlet weak var skipButton:UIButton!
    
    var images:[String] = ["Tutorial0","Tutorial1","Tutorial2","Tutorial3","Tutorial4","Tutorial5","Tutorial6"]
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
        
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    @IBAction func skipAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftMenuItems()
        self.title = (self.navigationController != nil) ? "App Tutorial" : ""
        self.skipButton.isHidden =  (self.navigationController != nil) ? true : false
        
        self.imageView.image = UIImage(named: self.images[0])
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(changePageIndex(_:)))
        swipeGestureRecognizerLeft.direction = .left
        
        let swipeGestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(changePageIndex(_:)))
        swipeGestureRecognizerRight.direction = .right
        
        self.swipeableView.addGestureRecognizer(swipeGestureRecognizerLeft)
        self.swipeableView.addGestureRecognizer(swipeGestureRecognizerRight)
        // Do any additional setup after loading the view.
    }
    
    @objc func changePageIndex(_ sender:UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .autoreverse) {
            self.imageView.layer.opacity = 0
        switch(sender.direction) {
        case .left:
            self.pager.currentPage = (self.pager.currentPage == 6) ? 0 : self.pager.currentPage + 1
        case .right:
            self.pager.currentPage = (self.pager.currentPage == 0) ? 6 : self.pager.currentPage - 1
        default: break
        }
            
        } completion: { _ in
            self.imageView.image = UIImage(named: "Tutorial\(self.pager.currentPage)")
            //UIView.animate(withDuration: 0.5, delay: 0, options: .autoreverse) {
                self.imageView.layer.opacity = 1
            //}
        }
    }
}

