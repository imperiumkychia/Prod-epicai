//
//  CommentCVC.swift
//  Daam
//
//  Created by Abdul on 10/10/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit
import JGProgressHUD

enum operationFlag:String {
    case NewComment
    case EditComment
    case EditReply
    case ReplyOnComment
}

private let reuseIdentifier = "EPICAICommentCell"

protocol UpdateCommentCountDelegate {
    func updateFeedCommentCount(indexPath:IndexPath?)
}

class EPICAICommentsVC: UICollectionViewController {
    
    var indexPath:IndexPath?
    
    var feedItem:EPICAIFeedItem!
    
    var items = [EPICAICommentItem]() {
        didSet {
            lastPagerViewIndices = [Int](repeating: 0, count: items.count)
        }
    }
    
    var lastPagerViewIndices = [Int]()
    var viewModel:EPICAICommentVM!
    var delegate:UpdateCommentCountDelegate?
    //var comments:[PostComment] = []
    var operationFlag:operationFlag = .NewComment
    var messageBottonAnchorContraints:NSLayoutConstraint!
    var messageViewHeightContraints:NSLayoutConstraint!
    
    fileprivate let writeMessageView:UIView = {
        let wMessageView  = UIView()
        wMessageView.translatesAutoresizingMaskIntoConstraints = false
        return wMessageView
    }()
    
    fileprivate lazy var replyTitleLbl:UILabel = {
        let rLbl = UILabel()
        rLbl.text = ""
        rLbl.textColor = UIColor.lightGray
        rLbl.font = UIFont.boldSystemFont(ofSize: 8)
        rLbl.translatesAutoresizingMaskIntoConstraints = false
        return rLbl
    }()
    
    fileprivate lazy var textView: UITextView = {
        let tv = UITextView()
        tv.layer.cornerRadius = 5
        tv.backgroundColor = .white
        tv.textColor = .darkGray
        tv.delegate = self
        tv.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return tv
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25.0, weight: .regular))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(moveBack(_:)), for: .touchUpInside)
        button.tintColor = Palette.V2.V2_VCTitle
        return button
    }()
    
    fileprivate let placeHolderLbl:UILabel = {
        let lbl = UILabel()
        lbl.text = "Add your comment..."
        lbl.textColor = UIColor(displayP3Red: 190/255, green: 200/255, blue: 200/255, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    fileprivate let sendMessageBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = Palette.darkPurple
        btn.setImage(UIImage(named: "messageIcon")?.resized(toWidth:25)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.addTarget(self, action: #selector(addNewComment(_:)), for: .touchUpInside)
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    var refreshControl: UIRefreshControl = {
        let controll = UIRefreshControl()
        controll.addTarget(self, action: #selector(initiateVideoModel), for: .valueChanged)
        return controll
    }()
    
    var ai: JGProgressHUD = {
        let indicator = JGProgressHUD(style: .light)
        indicator.textLabel.font = LatoFont.regular.withSize(15.0)
        indicator.cornerRadius = 20.0
        indicator.interactionType = .blockAllTouches
        return indicator
    }()
    
    func addBottomMessageView() {
        self.navigationItem.leftBarButtonItem?.customView = backButton
        //self.textView.delegate = self
        self.view.addSubview(writeMessageView)
        self.messageViewHeightContraints = writeMessageView.heightAnchor.constraint(equalToConstant: 60)
        self.messageViewHeightContraints.isActive = true
        writeMessageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        writeMessageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        messageBottonAnchorContraints = NSLayoutConstraint(item: writeMessageView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        textView.addSubview(placeHolderLbl)
        
        if let yPostion = self.textView.font?.pointSize {
            print("Y:\(yPostion/2)")
            textView.addConstraintsWithFormat(format: "H:|-5-[v0]|", views: placeHolderLbl)
            textView.addConstraintsWithFormat(format: "V:|-\(yPostion/2)-[v0]|", views: placeHolderLbl)
        }
        writeMessageView.addSubview(textView)
        writeMessageView.addSubview(sendMessageBtn)
        //writeMessageView.addSubview(replyTitleLbl)
        //writeMessageView.addConstraintsWithFormat(format: "V:|-0-[v0(15)]-2-|", views: replyTitleLbl)
        //writeMessageView.addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: replyTitleLbl)
        writeMessageView.addConstraintsWithFormat(format: "V:|-7-[v0]-7-|", views: textView)
        writeMessageView.addConstraintsWithFormat(format: "V:[v0(40)]-10-|", views: sendMessageBtn)
        writeMessageView.addConstraintsWithFormat(format: "H:|-8-[v0]-10-[v1(40)]-8-|", views: textView, sendMessageBtn)
        view.addConstraint(self.messageBottonAnchorContraints)
        
        switch(traitCollection.userInterfaceStyle) {
        case .light, .unspecified : writeMessageView.backgroundColor = UIColor.init(white: 0.90, alpha: 1)
        case .dark: writeMessageView.backgroundColor = UIColor.init(white: 0.15, alpha: 1)
        default:break
        }
    }
    
    @objc func initiateVideoModel() {
        print("Setting up feeds view model")
        
        self.viewModel = EPICAICommentVM()
        self.collectionView.reloadData()
        self.viewModel.onReciveComments = { items in
            if let items = items {
                DispatchQueue.main.async {
                    self.items = items
                    self.collectionView.reloadData()
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            } else {
                DispatchQueue.main.async {
                    self.refreshControl.endRefreshing()
                    self.ai.dismiss(afterDelay: 0.0, animated: true)
                }
            }
        }
        refreshFeedsData()
    }
    
    private func refreshFeedsData() {
        DispatchQueue.main.async {
            self.ai.textLabel.text = "Please wait..."
            self.ai.show(in: self.view, animated: true)
        }
        self.viewModel.getComments(videoUUID: self.feedItem.video.videoUUID)
    }
    
    @IBAction func moveBack(_ sender: Any) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func addNewComment(_ sender:UIButton) {
        if let text = self.textView.text, !text.isEmptyString()   {
            if let feedItem = feedItem {
                DispatchQueue.main.async {
                    self.ai.textLabel.text = "Please wait..."
                    self.ai.show(in: self.view, animated: true)
                }
                self.viewModel.addComment(feedItem: feedItem, text: text, indexPath: self.indexPath ?? [0,0]) { commentItem in
                    if let item = commentItem {
                        self.viewModel.items?.insert(item, at: 0)
                        self.collectionView.reloadData()
                        self.ai.dismiss(afterDelay: 0.0, animated: true)
                        self.textView.text = ""
                    }
                    self.viewModel.onUpdateCommentsCount = { indexPath in
                        self.delegate?.updateFeedCommentCount(indexPath: indexPath)
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tb = tabBarController as? GenericTabBarController {
            tb.hideFloatingTabBar(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comments"
        self.addBottomMessageView()
        self.initiateVideoModel()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        self.collectionView.addSubview(refreshControl)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboadHandler(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboadHandler(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboadHandler(notification:NSNotification) {
        let isKeyBoardShowing = notification.name == UIResponder.keyboardWillShowNotification
        if isKeyBoardShowing {
            if let keyFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                self.messageBottonAnchorContraints.constant = -keyFrame.cgRectValue.height + view.safeAreaInsets.bottom
            }
        }
        else {
            self.messageBottonAnchorContraints.constant = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: {[unowned self] (completed) in
            if isKeyBoardShowing {
                let lastSection = collectionView.numberOfSections - 1
                if lastSection > 0 {
                    let lastRow = collectionView.numberOfItems(inSection: lastSection)
                    let indexPath = IndexPath(row: lastRow - 1, section: lastSection)
                    self.collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
                }
                //                if let indexPath = self.indexPath {
                //                    self.collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
                //                }
                if let keyFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    self.collectionView.contentInset.bottom = keyFrame.cgRectValue.height + self.view.safeAreaInsets.bottom+50
                }
            }
            else {
                self.collectionView.contentInset.bottom = 0
            }
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  viewModel.items?.count ?? 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numberOfRowsInSection = self.viewModel.items?[section].replies.count, numberOfRowsInSection != 0 {
            return  (viewModel.items?.count ?? 0 > 0 ) ? numberOfRowsInSection + 1 :  0
        }
        else {
            return (viewModel.items?.count ?? 0 > 0 ) ? 1 :  0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0  {
            let commentCell = collectionView.dequeueReusableCell(withReuseIdentifier: EPICAICommentCell.identifier, for: indexPath) as! EPICAICommentCell
            commentCell.commnet = self.viewModel.items?[indexPath.section]
            commentCell.performReply = { indexPath in
                print("performReply index path : \(indexPath)")
                let controller = EPICAINotePopUpVC.instantiateFromAppStoryBoard(appStoryBoard: .Comment)
                controller.indexPath = indexPath
                controller.delegate = self
                self.present(controller, animated: true, completion: nil)
            }
            return commentCell
        }
        else {
            if let count = self.viewModel.items?[indexPath.section].replies.count, count > 0  {
                let commentReplyCell = collectionView.dequeueReusableCell(withReuseIdentifier: EPICAIReplyCell.identifier, for: indexPath) as! EPICAIReplyCell
                if indexPath.row > 0 {
                    //commentReplyCell.commentItem = self.viewModel.items?[indexPath.section]
                    commentReplyCell.commentItem = self.viewModel.items?[indexPath.section].replies[indexPath.row-1]
                }
                return commentReplyCell
            }
            else { return UICollectionViewCell() }
        }
    }
}

extension EPICAICommentsVC : EPICAINotePopUpProtocol {
    
    func addReplyOnCommnet(indexPath: IndexPath, message: String) {
        if let feedItem = self.feedItem {
            if let comment = self.viewModel.items?[indexPath.section].comment {
                DispatchQueue.main.async {
                    self.ai.textLabel.text = "Please wait..."
                    self.ai.show(in: self.view, animated: true)
                }
                self.viewModel.addReplyOnComment(item: comment, feedItem: feedItem, text: message) { newCommentItem in
                    if let newCommentItem = newCommentItem {
                        self.viewModel.items?[indexPath.section].replies.insert(newCommentItem, at: 0)
                        self.collectionView.reloadData()
                        self.ai.dismiss(afterDelay: 0.0, animated: true)
                    }
                }
            }
        }
    }
}


extension EPICAICommentsVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize  {
        var preDefineHeight:CGFloat = 80
        if indexPath.row == 0 {
            let message = self.viewModel.items?[indexPath.section].comment.comment ?? ""
            if message.sizeOfString(font: UIFont.systemFont(ofSize: 14), constrainedToWidth: Double(UIScreen.main.bounds.width-16)).height > 80  {
            preDefineHeight = 80 + 10
            }
            return CGSize(width: UIScreen.main.bounds.width, height: message.sizeOfString(font: UIFont.systemFont(ofSize: 14), constrainedToWidth: Double(UIScreen.main.bounds.width-16)).height + preDefineHeight)
        }
        else {
            var message = ""
            if indexPath.row > 0 {
                message = self.viewModel.items?[indexPath.section].replies[indexPath.row-1].comment.comment ?? ""
            }

            if message.sizeOfString(font: UIFont.systemFont(ofSize: 14), constrainedToWidth: Double(UIScreen.main.bounds.width-16)).height > 80 {
                preDefineHeight = 80 + 10
            }
            return CGSize(width: UIScreen.main.bounds.width-16, height: message.sizeOfString(font: UIFont.systemFont(ofSize: 14), constrainedToWidth: Double(UIScreen.main.bounds.width-16)).height + preDefineHeight)
        }
        // return CGSize(width: UIScreen.main.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

let minMsgViewHeight:CGFloat = 60
let maxMsgViewHeight:CGFloat = 200

extension EPICAICommentsVC : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        self.placeHolderLbl.isHidden = !textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func updateViewFrame(txtString:String) {
        let rect = NSString(string: txtString).boundingRect(with: CGSize(width: self.view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12)], context: nil)
        let height = max(rect.height, minMsgViewHeight)
        self.messageViewHeightContraints.constant = maxMsgViewHeight > height ? height : maxMsgViewHeight
        UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCurlUp, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil) //Collection view bottom cell
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentTxt = textView.text ?? ""
        guard let stringRange = Range(range, in: currentTxt) else { return false }
        self.updateViewFrame(txtString: currentTxt.replacingCharacters(in: stringRange, with: text))
        return true
    }
}

