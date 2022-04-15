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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
