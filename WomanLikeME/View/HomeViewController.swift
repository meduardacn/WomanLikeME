//
//  HomeViewController.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var fullPhraseLabel: UILabel!
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var phraseView: UIView!
    
    private var presenter: HomePresenter?
    private var model: Woman!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        initialize()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func setLayout(){
        scrolView.bounces = false
    }
    private func initialize(){
        model  = Woman()
        presenter = HomePresenter(view: self, model: model)
    }
    @IBAction func onFavorite(_ sender: Any) {
        presenter?.onFavorite()
    }
    
}
// MARK: HomeViewDelegate
extension  HomeViewController : HomeViewDelegate {
    internal func favorite(image: String) {
        favoriteButton.imageView?.image = UIImage(named: image)
    }
    internal func setPhrase(phrase: String) {
        phraseLabel.text = phrase
        fullPhraseLabel.text = phrase
    }
    internal func setName(name: String) {
        nameLabel.text = name
    }
    internal func setAge(age: String) {
        ageLabel.text = age
    }
    internal func setJob(job: String) {
        jobLabel.text = job
    }
    internal func setText(text: String) {
        textLabel.text = text
    }
    internal func setImage(imageData: Data) {
        image.image = UIImage(data: imageData)
        
    }
    internal func setFavoriteImage(image: String){
        favoriteButton.imageView?.image = UIImage(named: image)
    }
}
