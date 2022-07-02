//
//  MessaegListTableViewCell.swift
//  InstragramClone
//
//  Created by jung on 2022/07/02.
//

import UIKit

class MessaegListTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfielImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userProfielImageView.layer.cornerRadius = 0.5 * userProfielImageView.bounds.size.width
        // Initialization code
    }
    
    func configure(_ data : MessageListModel) {
        userProfielImageView.image = data.userPorfile
        userNameLabel.text = data.userName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
