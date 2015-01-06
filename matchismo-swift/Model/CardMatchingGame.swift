//
//  CardMatchingGame.swift
//  matchismo-swift
//
//  Created by Cosmin Titei on 06/01/15.
//  Copyright (c) 2015 Cosmin Titei. All rights reserved.
//

import Foundation

let MISMATCH_PENALTY = 2
let MATCH_BONUS = 4
let COST_OF_CHOOSE = 1

class CardMatchingGame {
    
    var score: Int = 0
    var cards: Array<Card> = []
    
    init?(cardCount: Int, deck: Deck) {
        if cardCount < 2 {
            return nil
        }
        
        for i in 0...cardCount-1 {
            if let card = deck.drawRandomCard() {
                cards.append(card)
            } else {
                return nil;
            }
        }
    }
    
    func chooseCard(index: Int) {
        if let card = getCard(index) {
            if !card.matched {
                if card.chosen {
                    card.chosen = false
                } else {
                    // match agains other card
                    for otherCard in cards {
                        if otherCard.chosen && !otherCard.matched {
                            let matchScore = card.match([otherCard])
                            if  matchScore > 0 {
                                score += matchScore * MATCH_BONUS
                                card.matched = true
                                otherCard.matched = true
                            } else {
                                score -= MISMATCH_PENALTY
                            }
                            break;
                        }
                    }
                    score -= COST_OF_CHOOSE
                    card.chosen = true
                }
            }
        }
    }
    
    func getCard(index: Int) -> Card? {
        return index < cards.count && index >= 0 ? cards[index] : nil
    }
}