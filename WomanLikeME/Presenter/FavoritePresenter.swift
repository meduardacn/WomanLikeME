//
//  FavoritePresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 05/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

final class FavoritePresenter {
    private let view: FavoriteViewDelegate
    private var model : Woman?
    private var favoriteList : [Woman]
    
    required init(view: FavoriteViewDelegate){
        self.view = view
        model = Woman()
        favoriteList = User.sharedService.fecthListOfFAvorite()
    }
    func reload(){
        favoriteList = User.sharedService.fecthListOfFAvorite()
    }
    func fecthId(index: Int) -> Int{
        return favoriteList[index].id
    }
    func fecthName(index: Int) -> String{
        return favoriteList[index].name
    }
    func fecthPhrase(index: Int) -> String{
        return favoriteList[index].phrase
    }
    func fecthImage(index: Int) -> String {
        return favoriteList[index].image
    }
    func countFavorite()->Int{
        return User.sharedService.fecthListOfFAvorite().count
    }
}
