//
//  SearchCollectionViewCell.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/16.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var feedImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with image : String){
        feedImageView.image = UIImage(named: image)
    }
    func imageSize(with width : Double) {
        feedImageView.bounds.size.width = width
        feedImageView.bounds.size.height = width
    }

}
