//
//  ViewController.swift
//  InstragramClone
//
//  Created by jung on 2022/06/07.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate {
    
    
    let feeds = [
        InstagramPost(numOfLikes: 1999, userName: "정석영", userProfileImage: "Logo", mainPostImage: "Logo2", userLocation: "고양시"),
        InstagramPost(numOfLikes: 200000, userName: "정석영2", userProfileImage: "Logo", mainPostImage: "Logo2", userLocation: "노원구"),
        InstagramPost(numOfLikes: 1, userName: "정석영3", userProfileImage: "Logo", mainPostImage: "Logo2", userLocation: "서울"),
        InstagramPost(numOfLikes: 123, userName: "정석영4545", userProfileImage: "Logo", mainPostImage: "Logo2", userLocation: "New York")
        
    ]
    
    
    
    @IBOutlet weak var maintableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoImageView = UIImageView()
        logoImageView.frame = CGRect(x: 0, y :0, width: 100, height: 30)
        logoImageView.image = UIImage(named: "logo_")
        
        logoImageView.backgroundColor = .blue
        logoImageView.contentMode = .scaleAspectFit
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoImageView)
        
        
        //        navigationItem.titleView?.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        //        navigationItem.title.locat
        tabBarController?.delegate = self
        
        maintableView.dataSource = self
        maintableView.delegate = self
        
        maintableView.register(UINib(nibName: K.storyNibName, bundle: nil), forCellReuseIdentifier: K.stroyCellID)
        // Do any additional setup after loading the view.
        maintableView.register(UINib(nibName: K.feedNibName, bundle: nil), forCellReuseIdentifier: K.feedCellID)
        //        navigationController?.isNavigationBarHidden = true
    }
    
}
//MARK: - UITableViewDataSorce & UITableViewDelegate


extension MainViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1{
            return feeds.count
        } else {
            return 0;
        }
    }
    
    //     height 지정 가능
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 60
        case 1:
            return 696
        default:
            return 0
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = maintableView.dequeueReusableCell(withIdentifier: K.stroyCellID, for: indexPath) as! StoryCell
            cell.configure()
            return cell
        case 1:
            let cell = maintableView.dequeueReusableCell(withIdentifier: K.feedCellID, for: indexPath) as! FeedCell
            cell.configure(with: feeds[indexPath.row])
            return cell
        default:
            return UITableViewCell()
            
        }
    }
}


extension MainViewController : UITabBarDelegate, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let navigationVC1 = tabBarController.selectedViewController as? UINavigationController, let navigationVC2 = viewController as? UINavigationController else {
            return true
        }
        if navigationVC1.viewControllers.first is MainViewController && navigationVC1 == navigationVC2 {
            maintableView.reloadData()
            let indexPath = IndexPath(row: 0, section: 0)
            maintableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        
        return true
    }
}


