//
//  ViewController.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 02/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var fullPhraseLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var modelId : Int?
    private var presenter: DetailsPresenter?
    private var model: Woman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailsPresenter(view: self, modelId: modelId!)
        inicialize()
    }
    
    func inicialize(){
        presenter?.initNameLabel()
        presenter?.initAgeLabel()
        presenter?.initJobLabel()
        presenter?.initPhraseLabel()
        presenter?.initTextLabel()
        presenter?.initImage()
        presenter?.initFavorite()
    }

    @IBAction func onShare(_ sender: Any) {
        // image to share
        let image = UIImage(named: "cat")
        
        // set up activity view controller
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        //activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        presenter?.OnShare()
    }
    @IBAction func onFavorite(_ sender: Any) {
        presenter?.onFavorite()
    }
}

extension DetailsViewController : DetailsViewDelegate{
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
    internal func setImage(imageStr: String) {
        image.image =  UIImage(named: imageStr)
    }
    internal func setFavoriteImage(image: String){
        favoriteButton.setImage( UIImage(named: image), for: .normal)
    }
}

