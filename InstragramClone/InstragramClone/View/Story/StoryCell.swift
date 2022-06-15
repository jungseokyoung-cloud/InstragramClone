//
//  FeedCell.swift
//  InstragramClone
//
//  Created by jung on 2022/06/15.
//

import UIKit

class StoryCell: UITableViewCell {
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyCollectionView.register(UINib(nibName: K.storyCell.cellNibName, bundle: nil), forCellWithReuseIdentifier: K.storyCell.cellId)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        
        storyCollectionView.showsHorizontalScrollIndicator = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure() {
        print(1)
        storyCollectionView.reloadData()
        let indexPath = IndexPath(row: 0, section: 0)
        storyCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
}



extension StoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: K.storyCell.cellId, for: indexPath) as! MyCollectionViewCell
        cell.progileImageView.image = UIImage(named: "Logo")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
}
