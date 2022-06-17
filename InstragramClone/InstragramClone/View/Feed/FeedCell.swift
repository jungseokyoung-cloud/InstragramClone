//
//  FeedCell.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var lableView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var userPostLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func printCell() {
        print(postImageView.bounds.height)
        print(lableView.bounds.height)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
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
        postImageView.image = UIImage(named: feed.mainPostImage)
        locationLable.text = feed.userLocation
        userPostLable.text = feed.userName
    }
}
