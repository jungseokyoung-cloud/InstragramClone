//
//  ListViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

//MARK: - MessageListModel
struct MessageListModel {
    let userPorfile : UIImage
    let userName : String
}

class MessageListViewController: UIViewController {
    var data = [MessageListModel]()
    
    private let messageListTableView : UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UINib(nibName: K.Message.dmListNib, bundle: nil), forCellReuseIdentifier: K.Message.dmListCellID)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.tabBarController?.tabBar.isHidden = true
        
        configureModel()
        setBackButton()
        view.addSubview(messageListTableView)
        messageListTableView.delegate = self
        messageListTableView.dataSource = self
        
        let userNameLabel = UILabel()
        userNameLabel.text = "jung SeokYoung"
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userNameLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        messageListTableView.frame = view.frame
        messageListTableView.backgroundColor = .systemBackground
    }
    
    func configureModel() {
        for _ in 1...10 {
            guard let profile = UIImage(named: "Logo") else { return  }
            let model = MessageListModel(userPorfile: profile, userName: "Jung")
            data.append(model)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
}

extension MessageListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = messageListTableView.dequeueReusableCell(withIdentifier: K.Message.dmListCellID, for: indexPath) as? MessaegListTableViewCell {
            cell.configure(data[indexPath.row])
            cell.backgroundColor = .systemBackground
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard(name: "ETC", bundle: nil).instantiateViewController(withIdentifier: K.StoryBoard.messageVC) as? MessageViewController {
            vc.userName = data[indexPath.row].userName
            guard let profile = UIImage(named: "Logo") else { return  }
            vc.userImage = profile
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }

}
