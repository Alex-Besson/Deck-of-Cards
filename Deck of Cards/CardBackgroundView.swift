//
//  CardBackgroundView.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-29.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class CardBackgroundView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }

    func configureView() {
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
}
