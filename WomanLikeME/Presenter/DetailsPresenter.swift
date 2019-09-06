//
//  DetailsPresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 06/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

final class DetailsPresenter {
    private let view: DetailsViewDelegate
    private var model : Woman!
    private var favoriteList : [Woman]

    required init(view: DetailsViewDelegate, modelId: Int){
        self.view = view
        favoriteList = User.sharedService.fecthListOfFAvorite()
        let modelList = favoriteList.filter({ $0.id == modelId })
        if modelList.count != 1{
            print("Ids replicados !!!!!")
        }
        model = modelList.first
    }
    
     // MARK: Init IBOutlets
    func initPhraseLabel(){
        view.setPhrase(phrase: model.phrase)
    }
    func initNameLabel(){
        view.setName(name: model.name)
    }
    func initAgeLabel(){
        let age = DateTransformation().ageCalculator(date: model.date)
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
