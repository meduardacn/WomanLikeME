//
//  CategoryViewController.swift
//  WomanLikeME
//
//  Created by Camile Ancines on 04/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var titleView: UIView!
    
    private var presenter : CategoryPresenter?
    let categories = Category()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CategoryPresenter(view: self)
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.bounces = false
        
        titleView.layer.shadowColor = UIColor.black.cgColor
        titleView.layer.shadowOpacity = 0.2
        titleView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCollectionViewCell else {fatalError()}
        
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.2
        cell.backView.layer.shadowOffset = CGSize(width: 2, height: 0)
        cell.backView.layer.shadowRadius = 6
        
        
        cell.categoryImageView.image = UIImage(named: (presenter?.getImage(index: indexPath[1]))! )
        cell.categoryLabel.text = presenter?.getLabel(index: indexPath[1])
        
        return cell
    }
}

extension CategoryViewController : CategoryViewDelegate{
    
}
