//
//  GameViewController.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-30.
//

import CoreData
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
    
    var gameEnded: Bool = false;
    var playerName: String = "The Player";
    var totalScore: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view.
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        let context = delegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity");
        request.returnsObjectsAsFaults = false;
        do {
            let result = try context.fetch(request);
            for data in result as! [NSManagedObject] {
                let cdName = (data.value(forKey: "name") as! String);
                playerName = cdName;
            }
        } catch {
            print("ERROR: Core Data could not fetch name.");
        }
        
        player.name = playerName;

        for i in 1...52 {
            let card = Card(temp: i);
            deck.append(card);
        }
        deck.shuffle();
        
        for j in 0...3 {
            if (j % 2 == 0) {
                house.draw(crd: deck[j]);
            } else {
                player.draw(crd: deck[j]);
            }
        }
    }
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        if (gameEnded == false) {
            initialize();
        } else {
            reset();
        }
    }
    
    @IBAction func hitBtnPressed(_ sender: UIButton) {
        if (gameEnded == true) {
            reset();
        } else if (player.score < 21 || player.position >= 4) {
            hit();
        } else {
            gameEnd();
        }
    }
    
    @IBAction func stayBtnPressed(_ sender: UIButton) {
        if (gameEnded == true) {
            reset();
        } else {
            gameEnd();
        }
    }
    
    func initialize() {
        startBtn.isHidden = true;
        
        hitBtn.isHidden = false;
        stayBtn.isHidden = false;
        
        houseCard1.image = UIImage(named: "\(house.hand[0].imgName)");
        houseCard2.image = UIImage(named: "\(house.hand[1].imgName)");
        houseCard3.image = UIImage(named: "cardback_red2.png");
        houseCard4.image = UIImage(named: "cardback_red2.png");
        houseCard5.image = UIImage(named: "cardback_red2.png");
        
        houseCard3.isHidden = true;
        houseCard4.isHidden = true;
        houseCard5.isHidden = true;
        
        playerCard1.image = UIImage(named: "\(player.hand[0].imgName)");
        playerCard2.image = UIImage(named: "\(player.hand[1].imgName)");
        playerCard3.image = UIImage(named: "cardback_red2.png");
        playerCard4.image = UIImage(named: "cardback_red2.png");
        playerCard5.image = UIImage(named: "cardback_red2.png");
        
        playerCard3.isHidden = true;
        playerCard4.isHidden = true;
        playerCard5.isHidden = true;
        
        for k in 0...1 {
            house.hand[k].revealed = true;
            player.hand[k].revealed = true;
        }
        house.score = house.calc();
        player.score = player.calc();
        
        scoreLbl.text = String(player.score);
    }
    
    func hit() {
        player.draw(crd: deck[player.position + 2]);
        player.hand[player.position].revealed = true;
        if (player.position == 2) {
            playerCard3.image = UIImage(named: "\(player.hand[2].imgName)");
            playerCard3.isHidden = false;
        } else if (player.position == 3) {
            playerCard4.image = UIImage(named: "\(player.hand[3].imgName)");
            playerCard4.isHidden = false;
        } else {
            playerCard5.image = UIImage(named: "\(player.hand[4].imgName)");
            playerCard5.isHidden = false;
        }
        player.position = player.position + 1;
        player.score = player.calc();
        scoreLbl.text = String(player.score);
        if (player.score > 21 || player.score <= 21 && player.position == 5) {
            gameEnd();
        }
    }
    
    func gameEnd() {
        while (player.score < 21 && house.score < player.score && house.score < 21 && house.position < 5) {
            house.draw(crd: deck[house.position + player.position + 2]);
            house.hand[house.position].revealed = true;
            if (house.position == 2) {
                print(house.hand[2].name);
                houseCard3.image = UIImage(named: "\(house.hand[2].imgName)");
                houseCard3.isHidden = false;
            } else if (house.position == 3) {
                print(house.hand[3].name);
                houseCard4.image = UIImage(named: "\(house.hand[3].imgName)");
                houseCard4.isHidden = false;
            } else {
                print(house.hand[4].name);
                houseCard5.image = UIImage(named: "\(house.hand[4].imgName)");
                houseCard5.isHidden = false;
            }
            house.position = house.position + 1;
            house.score = house.calc();
        }
        
        gameEnded = true;
        
        hitBtn.isHidden = true;
        stayBtn.isHidden = true;
        
        startBtn.isHidden = false;
        startBtn.setTitle("R E S E T", for: .normal);
        
        var msg = "";
        if (player.score > 21 || house.score <= 21 && player.score <= house.score) {
            totalScore = totalScore + (player.score - 50);
            msg = house.name + " wins the game! Your current score is " + String(totalScore);
        } else {
            totalScore = totalScore + (player.score + 50);
            msg = player.name + " wins the game! Your current score is " + String(totalScore);
        }
        
        let controller = UIAlertController(title: "Results", message: msg, preferredStyle: .actionSheet);
        let dismissAlert = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil);
        
        controller.addAction(dismissAlert);
        
        present(controller, animated: true, completion: nil);
    }
    
    func reset() {
        gameEnded = false;
        
        house.dump();
        player.dump();
        
        house.position = 2;
        player.position = 2;
        
        for i in 1...52 {
            let card = Card(temp: i);
            deck.append(card);
        }
        deck.shuffle();
        
        for j in 0...3 {
            if (j % 2 == 0) {
                house.draw(crd: deck[j]);
            } else {
                player.draw(crd: deck[j]);
            }
        }
        
        initialize();
    }
}
