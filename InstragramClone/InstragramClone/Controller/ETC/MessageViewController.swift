//
//  MessageViewController.swift
//  InstragramClone
//
//  Created by jung on 2022/06/30.
//

import UIKit

class MessageViewController: UIViewController {
    var userName = ""
    var userImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setBackButton()
        let userNameLabel = UILabel()
        userNameLabel.text = self.userName
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userNameLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
    }
    
}
