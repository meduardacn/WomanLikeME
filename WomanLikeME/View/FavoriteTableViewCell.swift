//
//  FavoriteTableViewCell.swift
//  WomanLikeME
//
//  Created by Camile Ancines on 03/09/19.
//  Copyright © 2019 Maria Eduarda Casanova Nascimento. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    var womanlId : Int?
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var womanImageView: UIImageView!
    @IBOutlet weak var womanNameLabel: UILabel!
    @IBOutlet weak var womanPhraseLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

}
