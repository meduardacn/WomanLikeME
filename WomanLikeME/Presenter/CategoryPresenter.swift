//
//  CategoryPresenter.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 05/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

final class CategoryPresenter {
    private let view: CategoryViewDelegate
    private let category : Category
    
    required init(view: CategoryViewDelegate){
        self.view = view
       category = Category()
    }
    func getLabel(index: Int) -> String {
        return category.categories[index]
    }
    func getImage(index: Int) -> String {
        return "category\(index)"
    }
}
