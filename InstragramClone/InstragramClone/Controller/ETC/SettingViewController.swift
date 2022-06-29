//
//  SettingViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/18.
//

import UIKit

/// Setting Struct
struct SettingCellModel {
    let title : String
    let handler: (() -> Void)
}

class SettingViewController: UIViewController {

    private var data = [[SettingCellModel]]()
    
    private let settingTableView : UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setBackButton()
        navigationItem.title = "설정"
        configureModel()
        
        view.addSubview(settingTableView)
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        settingTableView.frame = view.bounds
    }
    
    private func configureModel() {
        let section = [
            SettingCellModel(title: "로그아웃", handler: {[weak self] in
                self?.didTapLogOut()
            })
        ]
        data.append(section)
    }
    private func didTapLogOut() {
        if let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: K.StoryBoard.loginNavigation) as? UINavigationController {
            firstVC.modalPresentationStyle = .fullScreen
            present(firstVC, animated: false)
        }
        
    }

}

//MARK: - UITableViewDelegate / Datasource
extension SettingViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingTableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
