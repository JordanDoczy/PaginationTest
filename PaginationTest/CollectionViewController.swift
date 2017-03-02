//
//  CollectionViewController.swift
//  PaginationTest
//
//  Created by Jordan Doczy on 3/1/17.
//  Copyright © 2017 Jordan Doczy. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    let data: [[UIColor]] = [[.red, .blue, .yellow], [.green, .orange, .purple]]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath)
        
        if let cell = cell as? CollectionViewCell {
            cell.data = data[indexPath.row]
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
}
