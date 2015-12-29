//
//  NoButton.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-29.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class NoButton: UIButton {

    var originalSize = CGRect()
    var positionRect = CGRect()
    
    let myImgView = UIImageView()
    
    var originalViewSize = CGRect()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addImage()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        positionRect = rect
        
        let path = UIBezierPath(ovalInRect: CGRectMake(2, 2, rect.width - 4, rect.height - 4))
        UIColor.blackColor().setStroke()
        path.lineWidth = 4
        path.stroke()
        
    }
    
    func addImage() {
        
        myImgView.frame = CGRectMake(8, 8, self.bounds.width - 16, self.bounds.height - 16)
        let myImage = UIImage(named: "No")
        myImgView.image = myImage
        
        self.addSubview(myImgView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalSize = self.frame
        originalViewSize = myImgView.frame
        
        if let touch = touches.first {
            self.frame = CGRectMake(6, 6, originalSize.width - 12, originalSize.height - 12)
            myImgView.frame = CGRectMake(6, 6, originalSize.width - 26, originalSize.height - 26)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            self.frame = originalSize
            myImgView.frame = originalViewSize
        }
    }

}
