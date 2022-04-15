//
//  HomeViewController.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-30.
//

import CoreData
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1;
        
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        let context = delegate.persistentContainer.viewContext;
        
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context);
        let user = NSManagedObject(entity: entity!, insertInto: context);
        
        if (self.nameField.text!.isEmpty) {
            user.setValue("The Player", forKey: "name");
        } else {
            user.setValue("\(self.nameField.text!)", forKey: "name");
        }
        
        do {
            try context.save();
        } catch {
            print("ERROR: Core Data was unable to store name.");
        }
    }
    
    @IBAction func nameFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    @IBAction func bgTap(_ sender: UITapGestureRecognizer) {
        nameField.resignFirstResponder();
    }
    
}
