//
//  CardImageView.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-29.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class CardImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureImageView()
    }

    func configureImageView() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
    }
}
