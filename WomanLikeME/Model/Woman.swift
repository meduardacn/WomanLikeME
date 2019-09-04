//
//  Woman.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

struct Woman{
    let name : String
    let date : String
    let carrer : String
    let textAbout : String
    let image : Data
    let phrase : String
    var saved : Bool = false
    
    init(){
        self.name = ""
        self.date = ""
        self.carrer = ""
        self.textAbout = ""
        self.image = Data(count: 0)
        self.phrase = ""
    }
    
    init(name : String, date : String, carrer : String, textAbout : String, image : Data, phrase : String) {
        self.name = name
        self.date = date
        self.carrer = carrer
        self.textAbout = textAbout
        self.image = image
        self.phrase = phrase
    }
}
