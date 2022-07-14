//
//  MessageCell.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/07/12.
//

import UIKit

class MessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    let messageView = UIView()
    let profileImageView = UIImageView()
    
    var isIncoming : Bool! {
        didSet{
            messageView.backgroundColor = isIncoming ? .clear : .systemGray2
            messageView.layer.borderWidth = 1
            messageView.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
        messageLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.65).isActive = true
        
        if isIncoming {
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
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: K.Message.dmCell)
        addSubview(profileImageView)
        addSubview(messageView)
        addSubview(messageLabel)
        
        messageView.layer.cornerRadius = 5
        messageLabel.numberOfLines = 0
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data : MessageModel) {
        messageLabel.text = data.text
        profileImageView.image = data.userProfile
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 20
    }
}

