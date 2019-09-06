//
//  Woman.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

class Woman {
    let id : Int
    let name : String
    let date : String
    let carrer : String
    let textAbout : String
    let image : String
    let phrase : String
    var saved : Bool
    var appear : Bool
    var dateAppear : String
    init(){
        self.id = 0
        self.name = ""
        self.date = ""
        self.carrer = ""
        self.textAbout = ""
        self.image = ""
        self.phrase = ""
        self.saved = false
        self.appear = false
        self.dateAppear = ""
    }
    
    init(name : String, date : String, carrer : String, textAbout : String, image : String, phrase : String, saved : Bool, id: Int) {
        self.name = name
        self.date = date
        self.carrer = carrer
        self.textAbout = textAbout
        self.image = image
        self.phrase = phrase
        self.saved = saved
        self.id = id
        self.appear = false
        self.dateAppear = ""
    }
}
