//
//  User.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct User{
    private var allWoman : [Woman]
    private var listOfFavorited : [Woman]
    
    init() {
        let database = ReadingPList()
        allWoman = database.returningData()
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
    
    func womanOftheDay() -> Woman{
        return Woman(name: "Bruna", date: "07/10/1998", carrer: "Estudante", textAbout: "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content.  Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. ", image: "DaniBraguini", phrase: "nunca vi ninguem", saved: false, id: 0)
    }
    
}
