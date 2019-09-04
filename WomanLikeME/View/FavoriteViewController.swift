//
//  FavoriteViewController.swift
//  WomanLikeME
//
//  Created by Camile Ancines on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class FavoriteViewControler: UIViewController {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.bounces = false
    }
}


extension FavoriteViewControler: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return favorites.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell else {fatalError()}
        
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.2
        cell.backView.layer.shadowOffset = CGSize(width: 2, height: 3)
        
        return cell
    }
    
    

}
