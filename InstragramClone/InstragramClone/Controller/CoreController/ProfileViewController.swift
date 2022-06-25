//
//  ProfileViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let postCount = 1
    let followerCnt = 100
    let follwingCnt = 150

    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var follwerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userNameLabel = UILabel()
        userNameLabel.text = "userName"
        userNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        profileImageView.layer.cornerRadius = 0.5 * profileImageView.bounds.size.width
        editProfileButton.layer.borderWidth = 2
        editProfileButton.layer.borderColor = UIColor.secondarySystemFill.cgColor
        setLabels()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: userNameLabel)
        
        // Do any additional setup after loading the view.
    }
    
    func setLabels() {
        postCountLabel.text = "\(postCount)\n게시"
        follwerCountLabel.text = "\(followerCnt)\n팔로워"
        followingCountLabel.text = "\(follwingCnt)\n팔로잉"
    }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
