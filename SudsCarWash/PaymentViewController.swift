//
//  PaymentViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/19/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var service: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var totalcost: UITextField!
    
    
    var finalPlace = ""
    var finalService = ""
    var finalCost = ""

    
    override func viewDidLoad() {
        place.text = finalPlace
        service.text = finalService
        cost.text = finalCost
        totalcost.text = finalCost
        
        super.viewDidLoad()
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
