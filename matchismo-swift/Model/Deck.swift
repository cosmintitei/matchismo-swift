//
//  Deck.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import Foundation

class Deck{
    var cards: Array<Card> = []
    
    func addCard(card: Card, atTop: Bool){
        if atTop {
            cards.insert(card, atIndex: 0)
        } else {
            cards.append(card)
        }
    }
    
    func addCard(card: Card) {
        self.addCard(card, atTop: false);
    }
    
    func drawRandomCard() -> Card? {
        var randomCard: Card?
        if (self.cards.count > 0) {
            let index: Int = Int(arc4random()) % self.cards.count
            randomCard = cards[index]
            self.cards.removeAtIndex(index)
        }
        return randomCard
    }

}