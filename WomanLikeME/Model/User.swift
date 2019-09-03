//
//  User.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct User{
    private var listOfFavorited : [Woman] = []
    
    mutating func addWoman(new: Woman){
        listOfFavorited.append(new)
    }
    func getList() -> [Woman] {
        return listOfFavorited
    }
    
}
