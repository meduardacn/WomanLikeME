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
    
    private var presenter: HomePresenter?
    private var model: Woman?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        initialize()
    }
    func setLayout(){
        scrolView.bounces = false
    }
    private func initialize(){
        model  = Woman()
        presenter = HomePresenter(view: self, model: model!)
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
}
