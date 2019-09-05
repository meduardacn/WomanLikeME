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
    private let database = CoreDataCoordinator()

    init() {
        allWoman = database.fetchAllWoman()
    }
    
    mutating func addWoman(new: Woman){
        database.saveChanges()
    }
    
    mutating func deleteWoman(new: Woman){
        database.saveChanges()
    }
    
    func getListOfFAvorite() -> [Woman] {
        return database.fetchFavoritedWomen()
    }
    
    func womanOftheDay() -> Woman? {
        return database.fetchWomanOfTheDay()
    }
    
}
