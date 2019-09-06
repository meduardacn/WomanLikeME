//
//  User.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct User{
    static var sharedService = User()
    private var allWoman : [Woman] = []
    private var listOfFavorited : [Woman] = []
    private var dayWoman : Woman = Woman()
    init() {
        inicialize()
    }
    mutating func inicialize(){
        initAllWoman()
        listOfFavorited  = allWoman.filter { $0.saved }
        initWomanOftheDay()
    }
    mutating func addWoman(new: Woman){
        listOfFavorited.append(new)
    }
    mutating func deleteWoman(new: Woman){
        listOfFavorited.removeAll { $0.id == new.id }
    }
    func fecthListOfFAvorite() -> [Woman] {
        return listOfFavorited
    }
    mutating func initAllWoman(){
        allWoman.append(contentsOf: ReadingPList.sharedData.returningData() )
        let w1 = Woman(name: "felina", date: "07/10/1998", carrer: "Estudante", textAbout: "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise. ", image: "cat", phrase: "nunca vi ninguem", saved: false, id: 0)
        let w2 = Woman(name: "miau", date: "07/10/1998", carrer: "Dorminhoca", textAbout: "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise. ", image: "cat", phrase: "nunca vi ninguem", saved: false, id: 1)
        allWoman.append(w1)
        allWoman.append(w2)

    }
    mutating func updateValue(model : Woman){
        if model.id == dayWoman.id {
            dayWoman = model
        }
        allWoman.removeAll { $0.id  == model.id }
        allWoman.append(model)
    }
    mutating func initWomanOftheDay(){
        var notAppear = allWoman.filter { !$0.appear }.first
        notAppear!.appear = true
        dayWoman = notAppear!
    }
    func womanOftheDay() -> Woman{
        return dayWoman
    }
//    mutating func saveAll(){
//        allWoman.forEach { $0.saved = true }
//    }
    
}
