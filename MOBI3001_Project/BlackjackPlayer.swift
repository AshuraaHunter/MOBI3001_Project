//
//  BlackjackPlayer.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-30.
//

import Foundation

class BlackjackPlayer {
    var name: String;
    var score: Int;
    var position: Int;
    var hand: [Card] = [Card]();
    
    init () {
        name = "undefined";
        score = 0;
        position = 2;
        hand = [Card]();
    }
    
    init (s1: String, i1: Int, i2: Int) {
        name = s1;
        score = i1;
        position = i2;
        hand = [Card]();
    }
    
    func draw(crd: Card) {
        hand.insert(crd, at: 0);
    }
    
    func dump() {
        hand.removeAll();
    }
    
    func calc() -> Int {
        var tempScore = Int(0);
        for card in hand {
            if (card.revealed == true) {
                tempScore += card.val;
            }
        }
        for card in hand {
            if (tempScore > 21 && card.revealed == true && card.val == 11) {
                card.val = 1;
                tempScore -= 10;
            }
        }
        return tempScore;
    }
}
