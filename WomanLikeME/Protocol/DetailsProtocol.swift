//
//  DetailsProtocol.swift
//  WomanLikeME
//
//  Created by Maria Eduarda Casanova Nascimento on 06/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import Foundation

protocol DetailsViewDelegate : class {
    func setPhrase(phrase: String)
    func setName(name: String)
    func setAge(age: String)
    func setJob(job: String)
    func setText(text: String)
    func setImage(imageStr: String)
    func setFavoriteImage(image: String)
}
