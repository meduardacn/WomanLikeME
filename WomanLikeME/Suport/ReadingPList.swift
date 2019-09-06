//
//  ReadingPList.swift
//  WomanLikeME
//
//  Created by Giulia Ferraro on 04/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

class ReadingPList {
    static var sharedData = ReadingPList()
    func returningData() -> [Woman] {
        var allWomen : [Woman] = []
        let urlPath = Bundle.main.url(forResource: "WomanLikeME", withExtension: "plist")
        if let arrayContents = NSMutableArray(contentsOf: urlPath!) as? [[Any]] {
            var i = 0
            for woman in arrayContents {
                let womanModel = Woman(name: woman[0] as! String, date: woman[1] as! String, carrer: woman[2] as! String, textAbout: woman[3] as! String, image: woman[4] as! String, phrase: woman[5] as! String, saved: woman[6] as! Bool, id: i )
                i += 1
                allWomen.append(womanModel)
            }
        }
        return allWomen
    }
    
}
