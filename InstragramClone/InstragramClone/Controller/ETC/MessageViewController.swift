//
//  MessageViewController.swift
//  InstragramClone
//
//  Created by jung on 2022/06/30.
//

import UIKit

struct MessageModel {
    let userProfile : UIImage
    let text : String
    let isIncoming : Bool
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
//        textView.layer.cornerRadius = textView.height/2
//        textView.layer.borderWidth = 0.4
        textView.layer.borderColor = UIColor.lightGray.cgColor
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(MessageCell.self, forCellReuseIdentifier: K.Message.dmCell)
        messageTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    func congifureData() {
        for i in 1...10 {
            if let image = UIImage(named: "Logo"){
                var income : Bool
                if(i % 2 == 0){
                    income = true
                } else {
                    income = false
                }
                if(i % 3 == 0){
                    let message_ = MessageModel(userProfile: image, text: "asd", isIncoming: income)

                    self.message.append(message_)

                } else {
                let message_ = MessageModel(userProfile: image, text: "asdsadsadasdasdasdsadsadsadasdasdasdsadasdasdsadsadasdasdasdsadsadsadasdasdasdsadasdasdsadsadasdasdasdsadsadsadasdasdasdsadasd", isIncoming: income)
                self.message.append(message_)
                }
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
        if  let cell = messageTableView.dequeueReusableCell(withIdentifier: K.Message.dmCell, for: indexPath) as? MessageCell {
            cell.isIncoming = message[indexPath.row].isIncoming

            cell.configure(message[indexPath.row])
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = IndexPath(row: indexPath.row, section: indexPath.section)
        let cell = messageTableView.cellForRow(at: idx)
        print(cell?.height)
    }
}
