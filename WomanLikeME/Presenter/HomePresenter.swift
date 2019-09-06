//
//  MainPresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

final class HomePresenter {
    private let view: HomeViewDelegate
    private var model : Woman
  
    var transform = DateTransformation()
    
    required init(view: HomeViewDelegate) {
        self.view = view
        model = User.sharedService.womanOftheDay()
    }
    func reload(){
        model = User.sharedService.womanOftheDay()
        initFavorite()
    }
    
    // MARK: Init IBOutlets
    func initPhraseLabel(){
        view.setPhrase(phrase: model.phrase)
    }
    func initNameLabel(){
        view.setName(name: model.name)
    }
    func initAgeLabel(){
        let age = transform.ageCalculator(date: model.date)
        view.setAge(age: age)
    }
    func initJobLabel(){
        view.setJob(job: model.carrer)
    }
    func initTextLabel(){
        view.setText(text: model.textAbout)
    }
    func initImage(){
        view.setImage(imageStr: model.image)
    }
    func initFavorite(){
        if model.saved{
            view.setFavoriteImage(image: "favFullWhiteButton")
        }else{
             view.setFavoriteImage(image:"favWhiteButton")
        }
    }
    // MARK: Button action functions
    func onFavorite(){
        if model.saved{
            model.saved = false
            User.sharedService.deleteWoman(new: model)
            
            view.setFavoriteImage(image: "favWhiteButton")
            
        }else{
            model.saved = true
            User.sharedService.addWoman(new: model)
            view.setFavoriteImage(image: "favFullWhiteButton")
        }
    }
    
    
    func OnShare(){
        
    }
    
    
    
}
