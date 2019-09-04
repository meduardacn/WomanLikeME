//
//  HomeViewController.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
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
    
  //  var presenter = MainPresenter()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        scrolView.bounces = false
        super.viewDidLoad()
        
        //tentando colocar a sombra, sem sucesso
        phraseView.layer.shadowColor = UIColor.black.cgColor
        phraseView.layer.shadowOpacity = 0.2
        phraseView.layer.shadowOffset = CGSize(width: 3, height: 2)
    
    }
    
    func inicializeScreen(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
}
