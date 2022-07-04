//
//  MessageViewController.swift
//  InstragramClone
//
//  Created by jung on 2022/06/30.
//

import UIKit

class MessageViewController: UIViewController {
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var cameraButton: UIButton!
    var userName = ""
    var userImage = UIImage()
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
//        cameraButton.imageView?.contentMode = .scaleAspectFit
        if let imageView = cameraButton.imageView {
            print(imageView.image?.size)
        }

    }
    
}

