//
//  card.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 05/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import Foundation

class Card{
    var contents: String {
        get {
           return ""
        }
    }
    var chosen: Bool
    var matched: Bool
    
    init () {
        self.chosen = false
        self.matched = false
    }
    
    func match(otherCards: Array<Card>) -> Int {
        var score = 0
        for card in otherCards {
            if (card.contents == self.contents) {
                score = 1
            }
        }
        return score
    }
}