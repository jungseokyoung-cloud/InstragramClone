//
//  PostViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class PostViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        
        self.view.backgroundColor = .systemRed
        
        // Do any additional setup after loading the view.
    }

    
    

}
