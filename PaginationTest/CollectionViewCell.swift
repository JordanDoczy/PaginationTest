//
//  CollectionViewCell.swift
//  PaginationTest
//
//  Created by Jordan Doczy on 3/1/17.
//  Copyright © 2017 Jordan Doczy. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [UIColor]? {
        didSet {
            collectionView.dataSource = self
            if data?.count == 0 {
                data?.append(.black)
            }
        }
    }
    
    func onCollectionCellTapped(sender: UITapGestureRecognizer) {
        guard let color = sender.view?.backgroundColor, color != .black, let index = data?.index(of: color) else {
            return
        }
        
        data?.remove(at: index)
        collectionView.reloadData()
    }
}

extension CollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCollectionCellTapped(sender : ))))
        cell.backgroundColor = data?[indexPath.row] ?? UIColor.black
        return cell
    }
}
