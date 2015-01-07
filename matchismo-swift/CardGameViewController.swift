//
//  ViewController.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!

    var deck: Deck = PlayingCardDeck()
    var game: CardMatchingGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = CardMatchingGame(cardCount: cardButtons.count, deck: deck)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchCardButton(sender: UIButton) {
        let cardIndex = NSArray(array: cardButtons).indexOfObject(sender)
        println(cardIndex)
        game!.chooseCard(cardIndex)
        updateUI()
    }
    
    func updateUI(){
        for cardButton in cardButtons {
            let cardIndex = NSArray(array: cardButtons).indexOfObject(cardButton)
            let card = game!.getCard(cardIndex)
            cardButton.setTitle(titleForCard(card!), forState: UIControlState.Normal)
            cardButton.setBackgroundImage(backgroundImageForCard(card!), forState: UIControlState.Normal)
            cardButton.enabled = !card!.matched
        }
        scoreLabel.text = "Score: \(game!.score)"
    }
    
    func titleForCard(card: Card) -> String {
        return card.chosen ? card.contents : ""
    }

    func backgroundImageForCard(card: Card) -> UIImage {
        return UIImage(named: card.chosen ? "cardfront" : "cardback")!
    }
}