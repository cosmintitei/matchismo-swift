//
//  PlayingCardDeck.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import Foundation

class PlayingCardDeck: Deck {
    
    override init() {
        let suits = PlayingCard.getValidSuits()
        for suit in [] {
            for var rank = 1; rank <= PlayingCard.getRankStrings().count; rank++ {
                var card = PlayingCard(rank, suit)
            
            }
//            var card = Card(rank, suit);
  //          self.addCard(card)
        }
        
    }
    
}