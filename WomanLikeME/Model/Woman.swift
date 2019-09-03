//
//  Woman.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct Woman{
    let tweetText : String
    let name : String
    let date : Date
    let carrer : String
    let textAbout : String
    let image : Data
    let phrase : String
    
    init(tweetText : String, name : String, date : Date, carrer : String, textAbout : String, image : Data, phrase : String) {
        self.tweetText = tweetText
        self.name = name
        self.date = date
        self.carrer = carrer
        self.textAbout = textAbout
        self.image = image
        self.phrase = phrase
    }
}
