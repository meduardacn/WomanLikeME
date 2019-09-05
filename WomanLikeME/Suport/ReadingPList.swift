//
//  ReadingPList.swift
//  WomanLikeME
//
//  Created by Giulia Ferraro on 04/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

class ReadingPList {
    
    //Returning all the women
    
    func returningData () -> [[String: Any]] {

        let urlPath = Bundle.main.url(forResource: "WomanLikeME", withExtension: "plist")
        let arrayContents = NSMutableArray(contentsOf: urlPath!) as? [[String: Any]]
        return arrayContents ?? [[:]]
    }
    
    //Saving woman and not returning anything
    
    func saveWoman () {
        let urlPath = Bundle.main.url(forResource: "WomanLikeME", withExtension: "plist")
        
        var arrayContents = NSMutableArray(contentsOf: urlPath!)
        var womanArray = arrayContents?[0] as! [Any]
        womanArray[0] = "Alice"
        arrayContents![0] = womanArray

        arrayContents?.write(to: urlPath!, atomically: true)
    }
    
    //Returning woman of the day
    
//    func getWomanDay () -> Woman {
//        var womanOfTheDay : Woman?
//
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "ddMMyyyy"
//        let result = formatter.string(from: date)
//
//        let allWoman = returningData()
//        let womanByDate = allWoman.filter{$0.dateAppeared == result}
//
//        if womanByDate.isEmpty {
//            let allFalse = allWoman.filter{$0.appeared == false}
//            womanOfTheDay = allFalse.first
//        } else {
//            womanOfTheDay = womanByDate.first
//        }
//
//        womanOfTheDay?.dateAppeared = result
//        womanOfTheDay?.appeared = true
//
//        let urlPath = Bundle.main.url(forResource: "WomanLikeME", withExtension: "plist")
//
//        if let arrayContents = NSMutableArray(contentsOf: urlPath!), var womanDictionary = arrayContents[womanOfTheDay!.id] as? [String: Any] {
//            womanDictionary["appeared"] = womanOfTheDay?.appeared
//            womanDictionary["dateAppeared"] = womanOfTheDay?.dateAppeared
//            arrayContents[womanOfTheDay!.id] = womanDictionary
            //arrayContents.write(toFile: urlPath, atomically: true)
            //arrayContents.write(to: urlPath!, atomically: true)
            
//            let encoder = PropertyListEncoder()
//            encoder.outputFormat = .xml
//            
//            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("WomanLikeME.plist")
//            
//            do {
//                let data = try encoder.encode(arrayContents)
//                try data.write(to: path)
//            } catch {
//                print(error)
//            }
            
//        }
//
//        return womanOfTheDay!
//    }
}
