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
    @IBOutlet weak var messageBubble: UIView!
    let messageColor = UIColor.systemGray2
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBody.numberOfLines = 0
        
        messageBubble.clipsToBounds = true
        messageBubble.layer.cornerRadius = messageBubble.height / 2
        messageBubble.layer.borderWidth = 0.4
        messageBubble.layer.borderColor = messageColor.cgColor
        
        messageBody.translatesAutoresizingMaskIntoConstraints = false
        messageBubble.translatesAutoresizingMaskIntoConstraints = false

        messageBubble.backgroundColor = .systemCyan
        
        
        myProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
        otherProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
        
    }

    
    
    func configure(_ data : MessageModel, _ isMe : Bool) {
        messageBody.text = data.messageBody
        messageBody.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
        
        if (isMe == true) {
            otherProfileImage.isHidden = true
            messageBubble.leadingAnchor.constraint(equalTo: myProfileImage.trailingAnchor, constant: 10).isActive = true
            messageBubble.centerYAnchor.constraint(equalTo: myProfileImage.centerYAnchor).isActive = true
            
            myProfileImage.image = data.userName
            
        } else {
            myProfileImage.isHidden = true
            messageBody.backgroundColor = messageColor
            otherProfileImage.image = data.userName

            messageBubble.trailingAnchor.constraint(equalTo: otherProfileImage.leadingAnchor, constant: -10).isActive = true
            messageBubble.centerYAnchor.constraint(equalTo: otherProfileImage.centerYAnchor).isActive = true

        }
        messageBody.topAnchor.constraint(equalTo: messageBubble.topAnchor, constant: 5).isActive = true
        messageBody.leadingAnchor.constraint(equalTo: messageBubble.leadingAnchor, constant: 5).isActive = true
        messageBody.bottomAnchor.constraint(equalTo: messageBubble.bottomAnchor, constant: -5).isActive = true
        messageBody.trailingAnchor.constraint(equalTo: messageBubble.trailingAnchor, constant: -5).isActive = true
        print((self.width/4) * 3)
        print(self.messageBody.width)
        print("print")
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
