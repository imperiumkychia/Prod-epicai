//
//  AppDelegate.swift
//  EPICAI
//
//  Created by Abdul fattah on 09/12/21.
//

import UIKit
import JGProgressHUD
import Amplify

class EPICAIAccountVC: UIViewController {

    let itemsMargin: CGFloat = 20.0
    private let profileImageWidth: CGFloat = 70.0

    lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 5, width: 30, height: 30))
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LatoFont.bold.withSize(18.0)
        label.textColor = Palette.V2.V2_VCTitle
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var profileImageViewContainer: UIView = {
        let profileImageViewContainer = UIView(frame: .zero)
        profileImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        profileImageViewContainer.layer.cornerRadius = profileImageWidth / 2.0
        profileImageViewContainer.layer.borderWidth = 1.0
        profileImageViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        profileImageViewContainer.clipsToBounds = true
        return profileImageViewContainer
    }()
    
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView(frame: .zero)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = #imageLiteral(resourceName: "noProfileImage")
        return profileImageView
    }()
    
    lazy var accountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LatoFont.regular.withSize(19.0)
        label.textColor = Palette.V2.V2_SettingsTableHeader
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "User Account"
        return label
    }()
    
    lazy var firstNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LatoFont.regular.withSize(19.0)
        label.textColor = Palette.V2.V2_VCTitle
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "First Name"
        return label
    }()
    
    lazy var firstNameTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = LatoFont.regular.withSize(19.0)
        tf.textColor = Palette.V2.V2_VCTitle
        tf.textAlignment = .left
        tf.placeholder = "First Name"
        tf.delegate = self
        return tf
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LatoFont.regular.withSize(19.0)
        label.textColor = Palette.V2.V2_VCTitle
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Last Name"
        return label
    }()
    
    lazy var lastNameTextField: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = LatoFont.regular.withSize(19.0)
        tf.textColor = Palette.V2.V2_VCTitle
        tf.textAlignment = .left
        tf.placeholder = "Last Name"
        tf.delegate = self
        return tf
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = LatoFont.regular.withSize(19.0)
        label.textColor = Palette.V2.V2_VCTitle
        label.textAlignment = .left
        label.numberOfLines = 1
        label.text = "Gender"
        return label
    }()
    
    lazy var genderControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Male" ,"Female"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentTintColor = .link
        control.backgroundColor = self.view.backgroundColor
        control.selectedSegmentIndex = 0
        control.layer.borderWidth = 1.0
        control.layer.borderColor = UIColor.link.cgColor
        control.addTarget(self, action: #selector(genderControlValueChanged(_:)), for: .valueChanged)
        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                           NSAttributedString.Key.font: LatoFont.bold.withSize(14.0)]
        let titleTextAttributesUnelected = [NSAttributedString.Key.foregroundColor: UIColor.link,
                                            NSAttributedString.Key.font: LatoFont.regular.withSize(14.0)]
        control.setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
        control.setTitleTextAttributes(titleTextAttributesUnelected, for: .normal)
        return control
    }()
    
    lazy var saveButton: UIButton = {
        let button =  UIButton(frame: CGRect(x: 0, y: 5, width: 70, height: 30))
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveButtonTapped(_:)), for: .touchUpInside)
        button.setTitleColor(Palette.V2.V2_VCTitle, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = LatoFont.regular.withSize(14.0)
        return button
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockTouchesOnHUDView
        return indicator
    }()
    
    var userItem: EPICAIUserAccountItem?
    var imageTapRecognizer: UITapGestureRecognizer!
    var imagePickerLibrary = UIImagePickerController()
    var imagePickerCamera = UIImagePickerController()
    var timer: Timer?
    
    private func leftMenuItems() {
        let leftOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        leftOptionView.addSubview(self.backButton)
        let leftBaritem = UIBarButtonItem(customView: leftOptionView)
        self.navigationItem.leftBarButtonItem = leftBaritem
    }
    
    private func rightMenuItems() {
        let rightOptionView = UIView(frame: CGRect(x: 100, y: 1, width: 50, height: 49))
        rightOptionView.addSubview(self.saveButton)
        let rightBaritem = UIBarButtonItem(customView: rightOptionView)
        self.navigationItem.rightBarButtonItem = rightBaritem
    }
    
    
    private var viewModel: EPICAIAccountVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIElements()
        initiateViewModel()
        self.leftMenuItems()
        self.rightMenuItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Account"
        
    }

    private func setupUIElements() {
        view.backgroundColor = Palette.V2.V2_VCBackground
        view.addSubview(profileImageViewContainer)
        profileImageViewContainer.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(accountLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameLabel)
        view.addSubview(lastNameTextField)
        view.addSubview(genderLabel)
        view.addSubview(genderControl)
        view.addSubview(ai)
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        
        profileImageViewContainer.snp.makeConstraints { (make) in
            make.width.equalTo(profileImageWidth)
            make.height.equalTo(profileImageWidth)
            make.top.equalTo(10).offset(itemsMargin * 5.0)
            make.leading.equalTo(view).offset(itemsMargin)
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(profileImageViewContainer)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageViewContainer).offset(itemsMargin)
            make.leading.equalTo(profileImageViewContainer.snp.trailing).offset(15.0)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        accountLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageViewContainer)
            make.top.equalTo(profileImageViewContainer.snp.bottom).offset(30.0)
        }
        
        firstNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(accountLabel)
            make.top.equalTo(accountLabel.snp.bottom).offset(itemsMargin)
            make.width.equalTo(100.0)
        }
        
        firstNameTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(firstNameLabel)
            make.leading.equalTo(firstNameLabel.snp.trailing).offset(itemsMargin)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        lastNameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(accountLabel)
            make.top.equalTo(firstNameLabel.snp.bottom).offset(itemsMargin)
            make.width.equalTo(100.0)
        }
        
        lastNameTextField.snp.makeConstraints { (make) in
            make.centerY.equalTo(lastNameLabel)
            make.leading.equalTo(lastNameLabel.snp.trailing).offset(itemsMargin)
            make.trailing.equalTo(view).offset(-itemsMargin)
        }
        
        genderLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(accountLabel)
            make.top.equalTo(lastNameLabel.snp.bottom).offset(itemsMargin)
            make.width.equalTo(100.0)
        }
        
        genderControl.snp.makeConstraints { (make) in
            make.centerY.equalTo(genderLabel)
            make.leading.equalTo(genderLabel.snp.trailing).offset(itemsMargin)
            make.width.equalTo(180.0)
        }
        
        imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapOnProfileImage(_:)))
        imageTapRecognizer.numberOfTouchesRequired = 1
        imageTapRecognizer.numberOfTapsRequired = 1
        profileImageViewContainer.addGestureRecognizer(imageTapRecognizer)
    }
    
    private func initiateViewModel() {
        view.isUserInteractionEnabled = false
        viewModel = EPICAIAccountVM()
        viewModel.onReceiveUserInfo = { userItem in
            if let userItem = userItem {
                self.userItem = userItem
                DispatchQueue.main.async {
                    self.nameLabel.text = (userItem.user.firstName) + " " + (userItem.user.lastName)
                    self.firstNameTextField.text = userItem.user.firstName
                    self.lastNameTextField.text = userItem.user.lastName
                    self.genderControl.selectedSegmentIndex = userItem.user.gender == "F" ? 1 : 0
                    self.profileImageView.image = userItem.userImage == nil ? #imageLiteral(resourceName: "noProfileImage") : userItem.userImage
                    self.view.isUserInteractionEnabled = true
                    self.ai.dismiss()
                }
            } else {
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.ai.dismiss()
                    EPICAIGenericAlertView().show(title: "Error",
                                                  message: "Error getting user information.",
                                                  onViewController: self,
                                                  isShort: true) {}
                }
            }
        }
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        viewModel.getUserInfo()
    }
    
    @objc func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func genderControlValueChanged(_ sender: UISegmentedControl) {

    }
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        guard var item = self.userItem,
              let image = profileImageView.image,
              let fName = firstNameTextField.text,
              let lName = lastNameTextField.text,
              fName != "", lName != "" else {
            DispatchQueue.main.async {
                EPICAIGenericAlertView().show(title: "Error",
                                              message: "First and last name cannot be empty.",
                                              onViewController: self,
                                              isShort: true) {}
            }
            return
        }
        
        //guard let updatedUser = item.user else { return }
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.ai.textLabel.text = "Please wait..."
            self.ai.indicatorView = JGProgressHUDIndeterminateIndicatorView()
            self.ai.show(in: self.view, animated: true)
        }
        item.user.firstName = fName
        item.user.lastName = lName
        item.user.gender = genderControl.selectedSegmentIndex == 0 ? "M" : "F"
        
        let imageName: String = "profile_image__\(item.user.uuid)__\(UUID().uuidString).png"
        
        viewModel.uploadProfileImage(image: image, key: imageName) { error in
            if let error = error {
                DispatchQueue.main.async {
                    EPICAIGenericAlertView().show(title: "Error",
                                                  message: "Error uploading image. \(error.localizedDescription)",
                                                  onViewController: self,
                                                  isShort: false) {}
                    self.view.isUserInteractionEnabled = true
                    self.ai.dismiss()
                }
                
            } else {
                item.user.imageUrl = imageName
                self.viewModel.updateUser(user: item.user) { error in
                    if let error = error {
                        DispatchQueue.main.async {
                            self.view.isUserInteractionEnabled = true
                            self.ai.dismiss()
                        }
                        print("Error updating user info: \(error)")
                        DispatchQueue.main.async {
                            EPICAIGenericAlertView().show(title: "Error",
                                                          message: "\(error.localizedDescription)",
                                                          onViewController: self,
                                                          isShort: false) {}
                        }
                    } else {
                        NotificationCenter.default.post(name: .userInfoUpdated, object: nil, userInfo: nil)
                        self.viewModel.getUserInfo()
                        DispatchQueue.main.async {
                            EPICAIGenericAlertView().show(title: "Success",
                                                          message: "Successfully updated user data.",
                                                          onViewController: self,
                                                          isShort: true) {}
                            self.view.isUserInteractionEnabled = true
                            self.ai.textLabel.text = "Saved!"
                            self.ai.indicatorView = JGProgressHUDSuccessIndicatorView()
                            self.ai.dismiss(afterDelay: 1.5, animated: true)
                        }
                    }
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func didTapOnProfileImage(_ sender: UITapGestureRecognizer) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.view.tintColor = Palette.V2.V2_VCTitle
        
        
        let photoLibAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.imagePickerLibrary = UIImagePickerController()
            self.imagePickerLibrary.delegate = self
            self.imagePickerLibrary.sourceType = .photoLibrary
            self.imagePickerLibrary.allowsEditing = true
            self.present(self.imagePickerLibrary, animated: true, completion: nil)
        }
        
        let cameraAction = UIAlertAction(title: "Take a photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePickerCamera.delegate = self
                self.imagePickerCamera.sourceType = .camera
                self.imagePickerCamera.allowsEditing = true
                self.imagePickerCamera.cameraDevice = .front
                self.imagePickerCamera.modalTransitionStyle = .flipHorizontal
                self.imagePickerCamera.cameraCaptureMode = .photo
                self.imagePickerCamera.showsCameraControls = true
                
                self.present(self.imagePickerCamera, animated: true, completion: nil)
                
                self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.didCapturePhoto), userInfo: nil, repeats: true)
            } else {
                DispatchQueue.main.async {
                    EPICAIGenericAlertView().show(title: "Error",
                                                  message: "Camera unavailable.",
                                                  onViewController: self,
                                                  isShort: true) { }
                }
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
        actionSheet.addAction(photoLibAction)
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(cancelAction)
        
        /// Important for iPad
        actionSheet.modalPresentationStyle = .popover
        actionSheet.popoverPresentationController?.sourceView = profileImageViewContainer
        actionSheet.popoverPresentationController?.sourceRect = profileImageViewContainer.bounds
        
        present(actionSheet, animated: true)
    }
    
    @objc func didCapturePhoto() {
        if self.imagePickerCamera.cameraDevice == .rear { return }
        for subview in self.imagePickerCamera.view.subviews {
            for subsubview in subview.subviews {
                for subsubsubview in subsubview.subviews {
                    for subsubsubsubview in subsubsubview.subviews {
                        for subsubsubsubsubview in subsubsubsubview.subviews {
                            for subsubsubsubsubsubview in subsubsubsubsubview.subviews {
                                for subsubsubsubsubsubsubview in subsubsubsubsubsubview.subviews {
                                    if subsubsubsubsubsubsubview.isKind(of: UIImageView.self) {
                                        subsubsubsubsubsubsubview.transform = self.imagePickerCamera.cameraViewTransform.scaledBy(x: -1, y: 1)
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
    }
}

extension EPICAIAccountVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension EPICAIAccountVC: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        let imageSize: CGFloat = 150.0
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            if picker == imagePickerLibrary {
                if image.size.width <= imageSize {
                    DispatchQueue.main.async {
                        self.profileImageView.image = image
                    }
                    
                } else {
                    let imageResized = image.resized(toWidth: imageSize)
                    DispatchQueue.main.async {
                        self.profileImageView.image = imageResized
                    }
                }
            } else {
                if image.size.width <= imageSize {
                    let flippedImage =  UIImage(cgImage: image.cgImage!, scale: image.scale, orientation: .upMirrored)
                    DispatchQueue.main.async {
                        self.profileImageView.image = flippedImage
                    }
                    
                } else {
                    if let imageResized = image.resized(toWidth: imageSize) {
                        let flippedImage = UIImage(cgImage: imageResized.cgImage!, scale: image.scale, orientation: .upMirrored)
                        DispatchQueue.main.async {
                            self.profileImageView.image = flippedImage
                        }
                    }
                }
                
                timer?.invalidate()
            }
            
        }
    }
}

extension EPICAIAccountVC: UINavigationControllerDelegate {
    
}
