//
//  DeckViewCard.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-29.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class DeckViewCard: UIView {
    
    var contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpContentView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpContentView()
        
    }
    
    // NIB SETUP
    
    func setUpContentView() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        contentView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        
        self.addSubview(contentView)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "DeckViewCard", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

}
