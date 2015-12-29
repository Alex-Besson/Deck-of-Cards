//
//  UIColorExtension.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-28.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}