//
//  NotificationViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var notifyTableView: UITableView!
    
    let flowNotify = 6
    let notification = ["A가 좋아요 눌렀음.", "B가 좋아요 눌렀음.", "C가 좋아요 눌렀음.", "A가 좋아요 눌렀음."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLable = UILabel()
        titleLable.text = "활동"
        titleLable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLable)
        
        notifyTableView.delegate = self
        notifyTableView.dataSource = self
    }
}
// MARK: - UITableViewDelegate, UITableViewDataSource
extension NotificationViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if flowNotify != 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.numberOfSections == 2 && section == 0 {
            return 1
        } else {
            return notification.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section)
        if tableView.numberOfSections == 2 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.NotificationVC.flowNotifyCell, for: indexPath)
            cell.textLabel?.text  = "팔로우 요청"
            cell.detailTextLabel?.text = "\(flowNotify)명의 팔로우 요청이 있습니다."
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: K.NotificationVC.notifyCell, for: indexPath)
            cell.textLabel?.text  = notification[indexPath.row]

            return cell
        }
    }
}
