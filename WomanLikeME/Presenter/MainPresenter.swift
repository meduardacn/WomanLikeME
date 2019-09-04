////
////  MainPresenter.swift
////  WomanLikeME
////
////  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
////  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
////
//
//import Foundation
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

//let presenter = HomePresenter()
//presenter.currentDate = presenter.transformDate(from: "24/01/1989")
//...
//
//presenter.ageCalculator("24/01/2019")


final class HomePresenter {
    private let view: HomeViewDelegate
    private var model : Woman
  
    var transform = DateTransformation()
    
    required init(view: HomeViewDelegate, model: Woman) {
        self.view = view
        self.model = model
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
        
    }
    
    // MARK: Other functions
    func onFavorite(){
        if model.saved{
            //  excluir das  salvas
            view.favorite(image: "NotFavorited")
        }else{
            model.saved = true
            //  adicionar nas  salvas
           view.favorite(image: "favorited")
        }
    }
    
    
    
}
