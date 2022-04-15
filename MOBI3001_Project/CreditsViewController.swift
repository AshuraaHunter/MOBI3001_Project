//
//  CreditsViewController.swift
//  MOBI3001_Project
//
//  Created by w0450622 on 2022-03-30.
//

import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let today = NSDate();
        let formatter = DateFormatter();
        formatter.dateFormat = "MMM. d, yyyy";
        let str = formatter.string(from: today as Date);
        dateLbl.text = str;
    }
}
