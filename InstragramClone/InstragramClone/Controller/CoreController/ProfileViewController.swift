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
    let feeds = ["Logo", "Logo2", "Logo"]
    let tagFeeds = ["Logo2", "Logo", "Logo2","Logo", "Logo2", "Logo",
                    "Logo2", "Logo", "Logo2", "Logo", "Logo2", "Logo", "Logo2", "Logo", "Logo2"]
    
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
        storyTableVIew.isHidden = true
        storyTableVIew.delegate = self
        storyTableVIew.dataSource = self
        
        
        feedCollectionView.register(UINib(nibName: K.Search.searchNibName, bundle: nil), forCellWithReuseIdentifier: K.Search.searchCellID)
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
    }
    
    @IBAction func feedButtonPressed(_ sender: UIButton) {
        buttonDirection = 0
        feedButton.isSelected = true
        tagFeedButton.isSelected = false
        feedCollectionView.reloadData()
    }
    
    
    @IBAction func tagFeedButtonPressed(_ sender: UIButton) {
        buttonDirection = 1
        feedButton.isSelected = false
        tagFeedButton.isSelected = true
        feedCollectionView.reloadData()

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

//MARK: UICollectionViewDelegate, UICollectionViewDataSorce
extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if buttonDirection == 0 {
            return feeds.count
        } else {
            return tagFeeds.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: K.Search.searchCellID, for: indexPath) as! SearchCollectionViewCell
        
        if buttonDirection == 0 {
            
            cell.configure(with: feeds[indexPath.row])
            
        } else {
            cell.configure(with: tagFeeds[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize =  self.myView.width / 3
        print(cellSize)
        print(myView.width)
        return CGSize(width: cellSize, height: cellSize)
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
            feedButtonPressed(feedButton)
        } else {
            tagFeedButtonPressed(tagFeedButton)
        }
    }
    
    
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
