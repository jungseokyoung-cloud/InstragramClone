//
//  MyCollectionViewCell.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var progileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        progileImageView.layer.cornerRadius = 0.5 * progileImageView.bounds.size.width
        self.layer.cornerRadius = 0.7 * self.bounds.size.width
    }
}
