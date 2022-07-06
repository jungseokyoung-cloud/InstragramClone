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
    
    let messageColor = UIColor.systemGray2
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func creatMessageBody() -> UILabel{
        let label = UILabel()
        label.frame.size = label.sizeThatFits(CGSize(width: (self.frame.width / 3) * 2, height: self.frame.height))
//        label.clipsToBounds = true
        label.layer.cornerRadius = label.height / 2
        label.layer.borderWidth = 0.4
        label.layer.borderColor = messageColor.cgColor
        return label
    }

    
    func configure(_ data : MessageModel, _ isMe : Bool) {
        let messageBody = creatMessageBody()
        messageBody.text = data.messageBody
        
        myProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
        otherProfileImage.layer.cornerRadius = myProfileImage.bounds.size.width * 0.5
 
        if (isMe == true) {
            otherProfileImage.isHidden = true
            messageBody.frame.origin = CGPoint(x: myProfileImage.frame.origin.x + myProfileImage.frame.width + 5, y: 0)
            myProfileImage.image = data.userName

        } else {
            myProfileImage.isHidden = true
            messageBody.backgroundColor = messageColor
            messageBody.frame.origin = CGPoint(x: otherProfileImage.frame.origin.x - 5 - messageBody.frame.width, y: 0)
            otherProfileImage.image = data.userName

        }
        messageBody.backgroundColor = .systemRed
        self.contentView.addSubview(messageBody)
//        self.addSubview(messageBody)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
