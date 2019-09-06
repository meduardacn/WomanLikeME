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
        favoriteList = User.sharedService.getListOfFAvorite()
    }
    func reload(){
        favoriteList = User.sharedService.getListOfFAvorite()
    }
    func getName(index: Int) -> String{
        return favoriteList[index].name
    }
    func getPhrase(index: Int) -> String{
        return favoriteList[index].phrase
    }
    func getImage(index: Int) -> String {
        return favoriteList[index].image
    }
    func countFavorite()->Int{
        return User.sharedService.getListOfFAvorite().count
    }
}
