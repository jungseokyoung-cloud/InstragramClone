//
//  MessageCell.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/07/12.
//

import UIKit

class MessageCell: UITableViewCell {
    
    let messageLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    let messageView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray2.cgColor
        return view
    }()
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    var messageModel : MessageModel! {
        didSet{
            print("didset")
            messageView.backgroundColor = messageModel.isIncoming ? .clear : .systemGray2
            
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
            profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
            profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            messageLabel.topAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -8).isActive = true
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.65).isActive = true
            
            if messageModel.isIncoming {
                profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
                messageLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -10).isActive = true
                
            } else {
                profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
                messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
            }
            messageView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -5).isActive = true
            messageView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 5).isActive = true
            messageView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5).isActive = true
            messageView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -5).isActive = true
            messageLabel.text = messageModel.text
            profileImageView.image = messageModel.userProfile
        }
    }
    

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: K.Message.dmCell)
        addSubview(profileImageView)
        addSubview(messageView)
        addSubview(messageLabel)
        
        print("init now")
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data : MessageModel) {
//        messageView.backgroundColor = data.isIncoming ? .clear : .systemGray2
//
//        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
//        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        messageLabel.topAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -8).isActive = true
//        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
//        messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.65).isActive = true
//
//        if data.isIncoming {
//            profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
//            messageLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -10).isActive = true
//
//        } else {
//            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
//            messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10).isActive = true
//        }
//        messageLabel.text = data.text
//        profileImageView.image = data.userProfile
//        messageView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -5).isActive = true
//        messageView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 5).isActive = true
//        messageView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5).isActive = true
//        messageView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -5).isActive = true
    }
}

