//
//  DeckView.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-28.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class DeckView: UIView {
    
    var cards = [UIView]()
    var topCard = UIView()
    
    var panGesture = UIPanGestureRecognizer()
    var tapGesture = UITapGestureRecognizer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpInitialCards(10)
        setUpGestures()
        organizeCards()
        
        topCard = cards[cards.count - 1]
    }

    func setUpInitialCards(numberOfViews: Int?) {
        
        if numberOfViews != nil && numberOfViews != 0 {
            for var x = 0; x < numberOfViews; x++ {
                let card = DeckViewCard()
                setUpViewForCard(card)
                cards.append(card)
            }
        } else {
            let singleCard = DeckViewCard()
            setUpViewForCard(singleCard)
            cards.removeAll()
            cards.append(singleCard)
        }
        
        addCardsAsSubviews()
    }
    
    func addCardsAsSubviews() {
        for card in cards {
            self.addSubview(card)
        }
    }
    
    func organizeCards() {
        if cards.count >= 3 {
            for var x = cards.count - 1; x >= cards.count - 4; x-- {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    let multiplyer = CGFloat(self.cards.count - 1 - x)
                    
                    self.cards[x].frame = CGRectMake(1 * multiplyer, 4 * multiplyer, self.bounds.width - 2 * multiplyer, self.bounds.height - 2 * multiplyer)
                })
                
                cards[cards.count - 1].addGestureRecognizer(panGesture)
                cards[cards.count - 1].addGestureRecognizer(tapGesture)
                cards[cards.count - 1].userInteractionEnabled = true
            }
            
        }
    }
    
    func setUpViewForCard(view: UIView) {
        view.frame = CGRectMake(1, 4, self.bounds.width - 2, self.bounds.height - 2)
//        view.backgroundColor = UIColor.randomColor()
        
    }
    
    func tossCard() {
        cards[cards.count - 1].removeFromSuperview()
        cards.removeAtIndex(cards.count - 1)
        
        let newCard = DeckViewCard()
        setUpViewForCard(newCard)
        cards.insert(newCard, atIndex: 0)
        
        organizeCards()
        addCardsAsSubviews()
    }
    
    func retrieveCar() {
        cards.removeFirst()
        
        let newCard = DeckViewCard()
        setUpViewForCard(newCard)
        cards.insert(newCard, atIndex: cards.count)
    }
    
    func setUpGestures() {
        panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
    }
    
    func handlePan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translationInView(self)
        
        if let card = gesture.view {
            
            card.center = CGPoint(x: card.bounds.width / 2 + translation.x, y: card.bounds.height / 2 + translation.y)
            
            let xFromCentre = card.center.x - topCard.bounds.width / 2
            
            self.shadowAppears(card, distanceTraveled: xFromCentre)
            
//            let scale = max(1 / abs(xFromCentre), 1)
            
            let rotation = CGAffineTransformMakeRotation(xFromCentre / 550)
//            let stretch = CGAffineTransformScale(rotation, scale, scale)
//            card.transform = stretch
            
            if gesture.state == UIGestureRecognizerState.Ended {
                
                if card.center.x < 50 {
                    
                    if let superV = self.superview {
                        
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            card.center = CGPoint(x: -(self.bounds.width / 2) - superV.bounds.width, y: superV.bounds.height / 2)
                            }, completion: { (completed) -> Void in
                                self.tossCard()
                        })
                       
                    }
                    
                    
                } else if card.center.x > self.bounds.width - 50 {
                    
                    if let superV = self.superview {
                        
                        UIView.animateWithDuration(0.3, animations: { () -> Void in
                            card.center = CGPoint(x: self.bounds.width / 2 + superV.bounds.width, y: superV.bounds.height / 2)
                            
                            }, completion: { (completed) -> Void in
                                self.tossCard()
                        })
    
                    }
                    
                } else {
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        card.center = CGPoint(x: card.bounds.width / 2, y: card.bounds.height / 2)
                        card.frame = self.topCard.frame
                        
                        }, completion: { (completed) -> Void in
                        self.shadowDisappears(card)
                    })

                }
            }
        }
        
    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        
    }
    
    func shadowAppears(view: UIView, distanceTraveled: CGFloat) {
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 10
        
        view.layer.shadowRadius = max(abs(distanceTraveled) / 10, 1)

    }
    
    func shadowDisappears(view: UIView) {
        view.layer.shadowRadius = 0
        view.layer.shadowOpacity = 0
        layoutIfNeeded()
    }
}
