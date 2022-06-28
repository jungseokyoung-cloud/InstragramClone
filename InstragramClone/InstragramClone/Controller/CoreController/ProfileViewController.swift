//
//  ProfileViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var buttonDirection = 0
    let postCount = 1
    let followerCnt = 100
    let follwingCnt = 150
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var feedCollectionView: UICollectionView!
    @IBOutlet weak var tagFeedButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var detaileButton: UIButton!
    @IBOutlet weak var storyTableVIew: UITableView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var follwerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        registerGesture()
        
        
        
        let userNameLabel = UILabel()
        userNameLabel.text = "userName"
        userNameLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        profileImageView.layer.cornerRadius = 0.5 * profileImageView.bounds.size.width
        editProfileButton.layer.borderWidth = 2
        editProfileButton.layer.borderColor = UIColor.secondarySystemFill.cgColor
        setLabels()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: userNameLabel)
        
        
        storyTableVIew.register(UINib(nibName: K.storyNibName, bundle: nil), forCellReuseIdentifier: K.stroyCellID)
        storyTableVIew.delegate = self
        storyTableVIew.dataSource = self
        storyTableVIew.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func setLabels() {
        postCountLabel.text = "\(postCount)\n게시"
        follwerCountLabel.text = "\(followerCnt)\n팔로워"
        followingCountLabel.text = "\(follwingCnt)\n팔로잉"
    }
    
    
    
    @IBAction func detailButtonClicked(_ sender: UIButton) {
        print("buttonPressed")
        if storyTableVIew.isHidden == true {
            print("isHidden")
            storyTableVIew.isHidden = false
            detaileButton.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        } else {
            storyTableVIew.isHidden = true
            detaileButton.setImage(UIImage(systemName: "arrow.down"), for: .normal)
        }
    }
}

//MARK: - UITableViewDataSource / UITableViewDelegate

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storyTableVIew.dequeueReusableCell(withIdentifier: K.stroyCellID, for: indexPath) as! StoryCell
        cell.configure()
        return cell
    }
    
    
}

//MARK: - addJecture
extension ProfileViewController : UIGestureRecognizerDelegate{
    func registerGesture() {
        let directions : [UISwipeGestureRecognizer.Direction] = [.right, .left]
        
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            gesture.direction = direction
            gesture.delegate = self
            self.myView.addGestureRecognizer(gesture)
        }
    }

    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.left :
            if buttonDirection == 1 {
                buttonDirection -= 1
            }
            break
        case UISwipeGestureRecognizer.Direction.right :
            buttonDirection = (buttonDirection + 1)%2
            break
        default:
            break
        }
        if buttonDirection == 0 {
            feedButton.isSelected = true
            tagFeedButton.isSelected = false
        } else {
            feedButton.isSelected = false
            tagFeedButton.isSelected = true
        }
    }
    
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
