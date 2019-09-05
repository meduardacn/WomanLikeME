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
    override func viewWillAppear(_ animated: Bool) {
        image.image =  UIImage(named: "DaniBraguini")
        //favoriteButton.setImage( UIImage(named: "DaniBraguini"), for: .normal)
        //favoriteButton.imageView?.image = UIImage(named: "DaniBraguini")
        presenter?.initPhraseLabel()
        presenter?.initNameLabel()
        presenter?.initAgeLabel()
        presenter?.initJobLabel()
        presenter?.initTextLabel()
        //presenter?.initImage()
        presenter?.initFavorite()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func setLayout(){
        scrolView.bounces = false
    }
    private func initialize(){
        model  = Woman(name: "Bruno", date: "07/10/1998", carrer: "Estudante", textAbout: "EU GOSTO MUITO DE CHOCOLOATE, e aturo a maria eduarda", image: "DaniBraguini", phrase: "nunca vi ninguem", saved: false)
        presenter = HomePresenter(view: self, model: model)
    }
    @IBAction func onFavorite(_ sender: Any) {
        presenter?.onFavorite()
    }
    
}
// MARK: HomeViewDelegate
extension  HomeViewController : HomeViewDelegate {
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
        favoriteButton.setImage( UIImage(named: image), for: .normal)
    }
}
