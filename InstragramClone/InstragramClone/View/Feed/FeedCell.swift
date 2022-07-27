//
//  FeedCell.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//

import UIKit
protocol CustomCellDelegate : AnyObject{
    func launchVC()
//    @objc func keyboardWillShow(notification: NSNotification)
}

class FeedCell: UITableViewCell {

    @IBOutlet weak var lableView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var commetView: UIView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userPostLable: UILabel!
    @IBOutlet weak var commentProfileImageView: UIImageView!
    
    weak var delegate : CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImageView.layer.cornerRadius = profileImageView.bounds.size.width * 0.5
        self.commentProfileImageView.layer.cornerRadius = commentProfileImageView.bounds.size.width * 0.5

        let gesture = UITapGestureRecognizer(target: self, action: #selector(postViewPressed(_:)))
        lableView.addGestureRecognizer(gesture)
    }
    
    func printCell() {
        print(postImageView.bounds.height)
        print(lableView.bounds.height)
    }

    @IBAction func likeButtonPressed(_ sender: UIButton) {
        print("like button pressed")
        
    }
    @IBAction func commentButtonPressed(_ sender: UIButton) {

    }
    
    @IBAction func sharedButtonPressed(_ sender: UIButton) {
    }
    @IBAction func messageButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func settingButtonPressed(_ sender: UIButton) {
    }
    
    func configure(with feed : InstagramPost){
        likesLabel.text = "좋아요 \(feed.getNumOfLikesString())개"
        userNameLable.text = feed.userName
        profileImageView.image = UIImage(named: feed.userProfileImage)
        commentProfileImageView.image = UIImage(named: feed.userProfileImage)
        postImageView.image = UIImage(named: feed.mainPostImage)
        locationLable.text = feed.userLocation
        userPostLable.text = feed.userName
        
    }
}

extension FeedCell {
    @objc func postViewPressed(_ sender:UITapGestureRecognizer) {
        delegate?.launchVC()
    }
}


