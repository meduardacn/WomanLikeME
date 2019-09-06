//
//  FavoriteViewController.swift
//  WomanLikeME
//
//  Created by Camile Ancines on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class FavoriteViewControler: UIViewController {
    private var presenter : FavoritePresenter?
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoritesTableView.delegate = self
        
        presenter = FavoritePresenter(view: self)
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        
        favoritesTableView.bounces = false
        favoritesTableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.reload()
        favoritesTableView.reloadData()
    }
}


extension FavoriteViewControler: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.countFavorite())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteTableViewCell else {fatalError()}
        
        cell.backView.layer.shadowColor = UIColor.black.cgColor
        cell.backView.layer.shadowOpacity = 0.2
        cell.backView.layer.shadowOffset = CGSize(width: 2, height: 3)
        cell.womanlId = presenter?.fecthId(index: indexPath[1])
        cell.womanImageView.image = UIImage(named: (presenter?.fecthImage(index: indexPath[1]))!)
        cell.womanNameLabel.text = presenter?.fecthName(index: indexPath[1])
        cell.womanPhraseLabel.text = presenter?.fecthPhrase(index: indexPath[1])
        cell.womanlId = presenter?.fecthId(index: indexPath[1])
        return cell
    }
    
    

}

extension FavoriteViewControler : FavoriteViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? FavoriteTableViewCell {
            self.performSegue(withIdentifier: "details", sender: cell)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details"{
            if let dest = segue.destination as? DetailsViewController{
                let cell = sender as? FavoriteTableViewCell
                dest.modelId = cell?.womanlId
            }
        }
    }
    
}
