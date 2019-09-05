//
//  DsteTransaformation.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 04/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct DateTransformation{
    init() {
    }
    var currentDate = Date()
    
    func transformDate(from string: String) -> Date? {
        let womanDate = string.split(separator: "/")
        let day = womanDate[0]
        let month = womanDate[1]
        let year = womanDate[2]
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "YYYY-MM-dd"
        return dateFormater.date(from: "\(year)-\(month)-\(day)")
    }
    
    func ageCalculator(date: String) -> String{
        let birthDate = transformDate(from: date)
        let calender = Calendar.current
        let dateComponent = calender.dateComponents([.year, .month, .day], from:
            birthDate!, to: currentDate)
        //return (dateComponent.year!, dateComponent.month!, dateComponent.day!)
        //print("\(age.0) Year, \(age.1) Month, \(age.2) Day")
        return String(dateComponent.year!)
    }
}
