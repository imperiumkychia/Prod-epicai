//
//  CreatePostActionCell.swift
//  Daam
//
//  Created by Abdul on 29/08/19.
//  Copyright © 2019 Abdul. All rights reserved.
//

import UIKit

protocol CreatePostCellActionProtocol {
    func pickAnImageRequest()
    func pickAnVideoRequest()
    func createPostRequest()
}

class CreatePostActionCell: UITableViewCell {

    static var identifier = "CreatePostActionCell"
    var delegate:CreatePostCellActionProtocol?
    
    @IBOutlet weak var mediaOptionStack: UIStackView!
    @IBOutlet weak var postBtn: CustomUIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(presentationType:String) {
    }
    
    @IBAction func pickAnImageActionCalled(_ sender: Any) {
        self.delegate?.pickAnImageRequest()
    }
    
    @IBAction func pickAnVideoActionCalled(_ sender: Any) {
        self.delegate?.pickAnVideoRequest()
    }
    
    @IBAction func createPostRequestAction(_ sender: Any) {
        self.delegate?.createPostRequest()
    }
    
}
