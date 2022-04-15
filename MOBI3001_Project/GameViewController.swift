//
//  GameViewController.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-30.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var hitBtn: UIButton!
    @IBOutlet weak var stayBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    
    @IBOutlet weak var houseCard1: UIImageView!
    @IBOutlet weak var houseCard2: UIImageView!
    @IBOutlet weak var houseCard3: UIImageView!
    @IBOutlet weak var houseCard4: UIImageView!
    @IBOutlet weak var houseCard5: UIImageView!
    
    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerCard5: UIImageView!
    
    var player = BlackjackPlayer();
    var house = BlackjackPlayer(s1: "The House", i1: 0, i2: 2);
    
    var deck = [Card]();
    var houseHand = [Card]();
    var playerHand = [Card]();
    
    var gameEnded: Bool = false;
    var playerName: String?;
    var totalScore: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        player.name = playerName ?? "The Player";

        // Do any additional setup after loading the view.
        for i in 1...52 {
            let card = Card(temp: i);
            deck.append(card);
        }
        deck.shuffle();
        
        for j in 0...9 {
            if (j % 2 == 0) {
                house.draw(crd: deck[j]);
            } else {
                player.draw(crd: deck[j]);
            }
        }
        houseHand = house.hand;
        playerHand = player.hand;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
