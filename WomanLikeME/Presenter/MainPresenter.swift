//
//  MainPresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

class MainPresenter{
    let womanOftheday : Woman
    
    init(woman : Woman) {
        self.womanOftheday = woman
    }
    
    func getData() -> [String]{
        let data : [String] = []
        data.append(womanOftheday.phrase)
        return data
    }
    
}
