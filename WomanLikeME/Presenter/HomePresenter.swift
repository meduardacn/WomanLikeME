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
    private var user : User
  
    var transform = DateTransformation()
    
    required init(view: HomeViewDelegate) {
        self.view = view
        user = User()
        model = user.womanOftheDay()
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
        if let data = Data(base64Encoded: model.image){
            view.setImage(imageData: data)
        }
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
            user.addWoman(new: model)
            view.setFavoriteImage(image: "favWhiteButton")
            
        }else{
            model.saved = true
            //  adicionar nas  salvas
           view.setFavoriteImage(image: "favFullWhiteButton")
        }
    }
    
    
    func OnShare(){
        
    }
    
    
    
}
