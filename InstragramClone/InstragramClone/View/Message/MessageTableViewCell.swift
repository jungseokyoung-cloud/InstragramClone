//
//  MessageTableViewCell.swift
//  InstragramClone
//
//  Created by jung on 2022/07/06.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var otherProfileImage: UIImageView!
    @IBOutlet weak var messageBody: UILabel!
    let messageColor = UIColor.systemGray2
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func creatMessageBody(){
        //        let messageSuperView = self.messageBody.superview
        messageBody.frame.size = messageBody.sizeThatFits(CGSize(width: (self.frame.width / 3) * 2, height: self.frame.height))
        messageBody.clipsToBounds = true
        messageBody.layer.cornerRadius = messageBody.height / 2
        messageBody.layer.borderWidth = 0.4
        messageBody.layer.borderColor = messageColor.cgColor
        messageBody.translatesAutoresizingMaskIntoConstraints = false
        otherProfileImage.translatesAutoresizingMaskIntoConstraints = false
        myProfileImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func configure(_ data : MessageModel, _ isMe : Bool) {
        creatMessageBody()
        messageBody.text = data.messageBody
    
        myProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
        otherProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
        if (isMe == true) {
            otherProfileImage.isHidden = true
            messageBody.leadingAnchor.constraint(equalTo: myProfileImage.trailingAnchor).isActive = true
            messageBody.centerYAnchor.constraint(equalTo: myProfileImage.centerYAnchor).isActive = true
            
            myProfileImage.image = data.userName
            
        } else {
            myProfileImage.isHidden = true
            messageBody.backgroundColor = messageColor
            otherProfileImage.image = data.userName
            messageBody.centerYAnchor.constraint(equalTo: otherProfileImage.centerYAnchor).isActive = true

            messageBody.trailingAnchor.constraint(equalTo: otherProfileImage.leadingAnchor).isActive = true
        }
        messageBody.backgroundColor = .systemRed
        //        self.addSubview(messageBody)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

/*
 -> messageBody -> 슈퍼뷰 가 존재 ->
 //. ----------- //
 ?? -----------! //
 352!
 442!
 frame superview -> UIView
 UIView.width = messageBody의 maxX
 
 frame -> superview
 
 */
