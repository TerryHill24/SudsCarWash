//
//  ConfirmViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/21/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var confirmNo: UITextField!
    @IBOutlet weak var labelz: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let randomInt = Int.random(in: 1..<5000000)
        confirmNo.text = "\(randomInt)"
        // Do any additional setup after loading the view.
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
