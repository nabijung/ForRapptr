//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellStyle()
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        avatarImageView.sd_setImage(with: URL(string: message.avatarURL!))
    }
    
    func setCellStyle(){
        self.backgroundColor = .clear
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
        avatarImageView.layer.masksToBounds = true
        
        header.textColor = UIColor(red: 27/255, green: 30/255, blue: 31/255, alpha: 1.0)
        header.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        
    }
}
