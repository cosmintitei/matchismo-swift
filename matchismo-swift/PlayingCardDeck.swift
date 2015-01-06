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
        super.init()
        for suit in PlayingCard.getValidSuits() {
            for var rank = 1; rank <= PlayingCard.getRankStrings().count - 1; rank++ {
                self.addCard(PlayingCard(rank: rank, suit: suit))
            }
        }
    }
    
}