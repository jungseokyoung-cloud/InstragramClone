//
//  MessageViewController.swift
//  InstragramClone
//
//  Created by jung on 2022/06/30.
//

import UIKit

struct MessageModel {
    let userName : UIImage
    let messageBody : String
}

class MessageViewController: UIViewController {
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var messageTableView: UITableView!
    
    var message = [MessageModel]()
    
    var userName = ""
    var userImage = UIImage()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congifureData()
        self.view.backgroundColor = .systemBackground
        setBackButton()
        let userNameLabel = UILabel()
        userNameLabel.text = self.userName
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userNameLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
        textView.clipsToBounds = true
        textView.layer.cornerRadius = textView.height/2
        textView.layer.borderWidth = 0.4
        textView.layer.borderColor = UIColor.lightGray.cgColor
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: K.Message.dmNib, bundle: nil), forCellReuseIdentifier: K.Message.dmCell)
        
        
        print(messageTableView.visibleCells.count)
    }
    
    func congifureData() {
        for _ in 1...10 {
            if let image = UIImage(named: "Logo"){
                let message_ = MessageModel(userName: image, messageBody: "asdsadsadasdasdasdsadsadsadasdasdasdsadasd")
                self.message.append(message_)
            }
        }
    }
    
    
}
//MARK: - UITableViewDelegate, UITableViewDatasource
extension MessageViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return message.count
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = messageTableView.dequeueReusableCell(withIdentifier: K.Message.dmCell, for: indexPath) as? MessageTableViewCell {
            var isMe = true
            if indexPath.row % 2 == 0 {
                isMe = false
            }
            cell.configure(message[indexPath.row], isMe)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
