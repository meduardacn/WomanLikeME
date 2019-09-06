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
    
    init() {
        inicialize()
    }
    mutating func inicialize(){
        initAllWoman()
        listOfFavorited  = allWoman.filter { $0.saved }
    }
    mutating func addWoman(new: Woman){
        listOfFavorited.append(new)
    }
    mutating func deleteWoman(new: Woman){
        listOfFavorited.removeAll { $0.id == new.id }
    }
    func getListOfFAvorite() -> [Woman] {
        return listOfFavorited
    }
    mutating func initAllWoman(){
        let w1 = Woman(name: "Bruna", date: "07/10/1998", carrer: "Estudante", textAbout: "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise. ", image: "DaniBraguini", phrase: "nunca vi ninguem", saved: false, id: 0)
        let w2 = Woman(name: "teste", date: "07/10/1998", carrer: "Estudante", textAbout: "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise. ", image: "DaniBraguini", phrase: "nunca vi ninguem", saved: true, id: 1)
        allWoman.append(w1)
        allWoman.append(w2)

    }
    func womanOftheDay() -> Woman{
        let notAppear = allWoman.filter { !$0.appear }
        return notAppear.first!
    }
    
}
