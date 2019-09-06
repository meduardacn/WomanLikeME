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
    func printId(){
        allWoman.forEach {
            print($0.id)
        }
    }
    mutating func inicialize(){
        initAllWoman()
        listOfFavorited  = allWoman.filter { $0.saved }
        initWomanOftheDay()
        printId()
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
        saveAll()

    }
    mutating func updateValue(model : Woman){
        if model.id == dayWoman.id {
            dayWoman = model
        }
        allWoman.removeAll { $0.id  == model.id }
        allWoman.append(model)
    }
    mutating func initWomanOftheDay(){
        let notAppear = allWoman.filter { !$0.appear }.first
        notAppear!.appear = true
        dayWoman = notAppear!
    }
    func womanOftheDay() -> Woman{
        return dayWoman
    }
    mutating func saveAll(){
        allWoman.forEach { $0.saved = true }
    }
    
}
