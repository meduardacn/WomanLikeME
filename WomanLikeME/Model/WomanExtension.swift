//
//  WomanExtension.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 05/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation
import CoreData

extension Woman {
    
    convenience init(name : String, date : String, carrer : String, textAbout : String, image : String, phrase : String, saved : Bool, id: Int) {
        let container = NSPersistentContainer(name: "WomanLikeME")

        self.init(context: container.viewContext)
        self.name = name
        self.date = date
        self.carrer = carrer
        self.textAbout = textAbout
        self.image = image
        self.phrase = phrase
        self.saved = saved
        self.id = Int64(id)
    }
}
