//
//  ViewController.swift
//  Deck of Cards
//
//  Created by Alexander Besson on 2015-12-28.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vwDeckView: DeckView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func noButtonPressed(sender: AnyObject) {
        vwDeckView.tossCard()
    }

    @IBAction func yesButtonPressed(sender: AnyObject) {
        vwDeckView.tossCard()
    }
}

