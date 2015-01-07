//
//  PlayingCard.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import Foundation

class PlayingCard: Card {
    var suit: String = "?"
    var rank: Int = 0
    
    override var contents: String {
        get {
            let rankStrings = PlayingCard.getRankStrings()
            return "\(rankStrings[self.rank])\(self.suit)"
        }
    };

    init(rank: Int, suit: String) {
        super.init()
        self.setRank(rank)
        self.setSuit(suit)
    }
        
    func setSuit(suit: String) {
        let validSuits: NSArray = PlayingCard.getValidSuits()
        if (validSuits.containsObject(suit)) {
            self.suit = suit
        }
    }
    
    class func getValidSuits()-> Array<String> {
        return ["♥", "♦", "♣", "♠"]
    }
    
    class func getRankStrings()-> Array<String> {
        return ["?", "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    func setRank(rank: Int) {
        if (rank <= self.getMaxRank()) {
            self.rank = rank
        }
    }
    
    func getMaxRank() -> Int {
        return PlayingCard.getRankStrings().count - 1
    }
    
    override func match(otherCards: Array<Card>) -> Int {
        var score = 0
        if otherCards.count == 1 {
            var otherCard = otherCards.first! as PlayingCard
            if suit == otherCard.suit {
                score = 1
            } else if rank == otherCard.rank {
                score = 4
            }
        }
        return score
    }
}