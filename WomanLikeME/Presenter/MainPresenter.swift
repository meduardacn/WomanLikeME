//
//  MainPresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

final class HomePresenter{
    private let view: HomeViewDelegate
    private let model : Woman
    
    required init(view: HomeViewDelegate, model: Woman) {
        self.view = view
        self.model = model
    }

    func initPhraseLabel(){
        view.setPhrase(phrase: model.phrase)
    }
    
    
    
    
    
    func getData() -> [String]{
        var data : [String] = []
       // data.append(womanOftheday.phrase)
        return data
    }
    
}
