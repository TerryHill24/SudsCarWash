//
//  Picker2ViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/19/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit

class Picker2ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var btnNext: UIButton!
    
    var locationData: [String] = [String]()
    
    let locations = ["2501 Marble Lane Rockford, IL", "832 Darkside Drive Rockford, IL", "2501 Patchwork Road Rockford, IL", "8321 Fossil Street Machesney Park, IL", "843 Branch Road Rockton, IL","216 5th Avenue Winnebago, IL", "904 W. Bagg Street Rochelle, IL"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return locations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return locations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        location.text = locations[row]
        btnNext.isEnabled = true
        
    }
    
    var locationText = ""
    var sentService = ""
    var sentCost = ""
    var receiveService = ""
    var receiveCost = ""
    
   
    @IBAction func btnNext(_ sender: UIButton) {
        self.locationText = location.text!
        performSegue(withIdentifier: "location", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! PaymentViewController
        vc.finalPlace = self.locationText
        vc.finalService = sentService
        vc.finalCost = sentCost
    }
    
    
    
    override func viewDidLoad()
    {
        sentService = receiveService
        sentCost = receiveCost
        btnNext.isEnabled = false
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
