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

final class HomePresenter{
    private let view: HomeViewDelegate
    private var model : Woman
    
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
        let age = ageCalculator(date: model.date)
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
    func ageCalculator(date: String) -> String{
        let womanDate = date.split(separator: "/")
        let day = womanDate[0]
        let month = womanDate[1]
        let year = womanDate[2]
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-dd"
        let dateOfBirth = dateFormater.date(from: "\(year)-\(month)-\(day)")
        
        let calender = Calendar.current
        let dateComponent = calender.dateComponents([.year, .month, .day], from:
            dateOfBirth!, to: Date())
        //return (dateComponent.year!, dateComponent.month!, dateComponent.day!)
        //print("\(age.0) Year, \(age.1) Month, \(age.2) Day")
        return String(dateComponent.year!)
    }
    
}
