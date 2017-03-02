//
//  ViewController.swift
//  PaginationTest
//
//  Created by Jordan Doczy on 3/1/17.
//  Copyright © 2017 Jordan Doczy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!

    var colors: [UIColor] = [.red, .blue, .green, .yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initScrollView()
        initCollectionView()
    }
    
    func initCollectionView () {
        collectionView.dataSource = self
    }
    
    func initScrollView() {
        let size = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
        colors.forEach {
            let view = UIView(frame: CGRect(origin: .zero, size: size))
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onViewTapped(sender : ))))
            view.backgroundColor = $0
            scrollView.addSubview(view)
        }
    }
    
    func onViewTapped(sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    func onCollectionCellTapped(sender: UITapGestureRecognizer) {
        guard let color = sender.view?.backgroundColor, let index = colors.index(of: color) else {
            return
        }
        
        colors.remove(at: index)
        collectionView.reloadData()
    }

    
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onCollectionCellTapped(sender : ))))
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}


class UIHorizontalScrollView: UIScrollView {
    
    fileprivate var currentXPosition: CGFloat = 0
    
    override func addSubview(_ view: UIView) {
        view.frame = CGRect(x: currentXPosition, y: 0, width: view.frame.width, height: view.frame.height)
        currentXPosition += view.frame.width
        super.addSubview(view)
        contentSize = CGSize(width: currentXPosition, height: frame.height)
    }
    
}

