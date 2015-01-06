//
//  ViewController.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {
    
    @IBOutlet weak var flipsLabel: UILabel!;
    var flipsCount = 0;
    lazy var deck: Deck = PlayingCardDeck();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchCardButton(sender: UIButton) {
        if (sender.currentTitle != nil && sender.currentTitle != "") {
            sender.setBackgroundImage(UIImage(named: "cardback"), forState: UIControlState.Normal);
            sender.setTitle("", forState: UIControlState.Normal);
        } else {
            let card = deck.drawRandomCard() as PlayingCard;
            sender.setBackgroundImage(UIImage(named: "cardfront"), forState: UIControlState.Normal);
            sender.setTitle(card.getContents(), forState: UIControlState.Normal);
        }
        self.flipsCount++;
        self.flipsLabel.text = "Flips: \(self.flipsCount)";
    }

}