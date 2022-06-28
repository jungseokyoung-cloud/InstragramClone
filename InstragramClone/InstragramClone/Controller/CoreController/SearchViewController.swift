//
//  SearchViewController.swift
//  InstragramClone
//
//  Created by Seok Young Jung on 2022/06/16.
//

import UIKit

class SearchViewController: UIViewController {
    
    let feeds = ["Logo", "Logo2", "Logo","Logo2", "Logo", "Logo2","Logo", "Logo2", "Logo",
                 "Logo2", "Logo", "Logo2", "Logo", "Logo2", "Logo", "Logo2", "Logo", "Logo2"]
    
    let searchController = UISearchController(searchResultsController: ResultViewController())
    
    @IBOutlet weak var feedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.register(UINib(nibName: K.Search.searchNibName, bundle: nil), forCellWithReuseIdentifier: K.Search.searchCellID)
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController

    }
}
//MARK: UICollectionViewDelegate, UICollectionViewDataSorce
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: K.Search.searchCellID, for: indexPath) as! SearchCollectionViewCell
        cell.configure(with: feeds[indexPath.row])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize =  UIScreen.main.bounds.size.width/3

        return CGSize(width: cellSize, height: cellSize)
    }
}

//MARK: UISearchResultsUpdation
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { // 매순간 호출 !
        guard let text = searchController.searchBar.text else {
            return
        }
//        print(text)
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
}
