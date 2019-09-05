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
    private var modelFirst : Woman?
    private var user : User
    
    required init(view: FavoriteViewDelegate){
        self.view = view
        user = User()
        modelFirst = user.getListOfFAvorite().first
    }
}
