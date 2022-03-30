//
//  Card.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-27.
//

import Foundation

class Card {
    var val: Int;
    var id: Int;
    var name: String;
    var imgName: String;
    var revealed: Bool;
    
    init () {
        val = 0;
        id = 0;
        name = "undefined";
        imgName = "undefined";
        revealed = false;
    }
    
    init (temp: Int) {
        id = temp;
        revealed = false;
        switch temp {
            case 1:
                val=11;
                name="Ace of Clubs";
                imgName="cardclubsa";
            case 2:
                val=2;
                name="Two of Clubs";
                imgName="cardclubs2";
            case 3:
                val=3;
                name="Three of Clubs";
                imgName="cardclubs3";
            case 4:
                val=4;
                name="Four of Clubs";
                imgName="cardclubs4";
            case 5:
                val=5;
                name="Five of Clubs";
                imgName="cardclubs5";
            case 6:
                val=6;
                name="Six of Clubs";
                imgName="cardclubs6";
            case 7:
                val=7;
                name="Seven of Clubs";
                imgName="cardclubs7";
            case 8:
                val=8;
                name="Eight of Clubs";
                imgName="cardclubs8";
            case 9:
                val=9;
                name="Nine of Clubs";
                imgName="cardclubs9";
            case 10:
                val=10;
                name="Ten of Clubs";
                imgName="cardclubs10";
            case 11:
                val=10;
                name="J of Clubs";
                imgName="cardclubsj";
            case 12:
                val=10;
                name="Q of Clubs";
                imgName="cardclubsq";
            case 13:
                val=10;
                name="K of Clubs";
                imgName="cardclubsk";
            case 14:
                val=11;
                name="Ace of Diamonds";
                imgName="carddiamondsa";
            case 15:
                val=2;
                name="Two of Diamonds";
                imgName="carddiamonds2";
            case 16:
                val=3;
                name="Three of Diamonds";
                imgName="carddiamonds3";
            case 17:
                val=4;
                name="Four of Diamonds";
                imgName="carddiamonds4";
            case 18:
                val=5;
                name="Five of Diamonds";
                imgName="carddiamonds5";
            case 19:
                val=6;
                name="Six of Diamonds";
                imgName="carddiamonds6";
            case 20:
                val=7;
                name="Seven of Diamonds";
                imgName="carddiamonds7";
            case 21:
                val=8;
                name="Eight of Diamonds";
                imgName="carddiamonds8";
            case 22:
                val=9;
                name="Nine of Diamonds";
                imgName="carddiamonds9";
            case 23:
                val=10;
                name="Ten of Diamonds";
                imgName="carddiamonds10";
            case 24:
                val=10;
                name="J of Diamonds";
                imgName="carddiamondsj";
            case 25:
                val=10;
                name="Q of Diamonds";
                imgName="carddiamondsq";
            case 26:
                val=10;
                name="K of Diamonds";
                imgName="carddiamondsk";
            case 27:
                val=11;
                name="Ace of Hearts";
                imgName="cardheartsa";
            case 28:
                val=2;
                name="Two of Hearts";
                imgName="cardhearts2";
            case 29:
                val=3;
                name="Three of Hearts";
                imgName="cardhearts3";
            case 30:
                val=4;
                name="Four of Hearts";
                imgName="cardhearts4";
            case 31:
                val=5;
                name="Five of Hearts";
                imgName="cardhearts5";
            case 32:
                val=6;
                name="Six of Hearts";
                imgName="cardhearts6";
            case 33:
                val=7;
                name="Seven of Hearts";
                imgName="cardhearts7";
            case 34:
                val=8;
                name="Eight of Hearts";
                imgName="cardhearts8";
            case 35:
                val=9;
                name="Nine of Hearts";
                imgName="cardhearts9";
            case 36:
                val=10;
                name="Ten of Hearts";
                imgName="cardhearts10";
            case 37:
                val=10;
                name="J of Hearts";
                imgName="cardheartsj";
            case 38:
                val=10;
                name="Q of Hearts";
                imgName="cardheartsq";
            case 39:
                val=10;
                name="K of Hearts";
                imgName="cardheartsa";
            case 40:
                val=11;
                name="Ace of Spades";
                imgName="cardspadesa";
            case 41:
                val=2;
                name="Two of Spades";
                imgName="cardspades2";
            case 42:
                val=3;
                name="Three of Spades";
                imgName="cardspades3";
            case 43:
                val=4;
                name="Four of Spades";
                imgName="cardspades4";
            case 44:
                val=5;
                name="Five of Spades";
                imgName="cardspades5";
            case 45:
                val=6;
                name="Six of Spades";
                imgName="cardspades6";
            case 46:
                val=7;
                name="Seven of Spades";
                imgName="cardspades7";
            case 47:
                val=8;
                name="Eight of Spades";
                imgName="cardspades8";
            case 48:
                val=9;
                name="Nine of Spades";
                imgName="cardspades9";
            case 49:
                val=10;
                name="Ten of Spades";
                imgName="cardspades10";
            case 50:
                val=10;
                name="J of Spades";
                imgName="cardspadesj";
            case 51:
                val=10;
                name="Q of Spades";
                imgName="cardspadesq";
            case 52:
                val=10;
                name="K of Spades";
                imgName="cardspadesk";
            default:
                val=0;
                name="undefined";
                imgName="";
        }
    }
}
