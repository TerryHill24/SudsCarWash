//
//  PickerViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/19/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var txtService: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    
    
    @IBOutlet weak var btnNext: UIButton!
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    var serviceData: [String] = [String]()

    
    let services = ["Automatic Touchless Wash", "Automatic Touchless Wash and Wax",
        "Hand Exterior Wash" , "Interior/Exterior Hand Wash", "Interior/Exterior Hand Wash and Wax", "Advanced Int/Ext Hand Wash and Wax"
]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return services[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return services.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        txtService.text = services[row]
        btnNext.isEnabled = true
        
        let price = services[row]
        
        
        if price == "Automatic Touchless Wash" {
            txtPrice.text = "$2.50" }
        else if price == "Automatic Touchless Wash and Wax" {
            txtPrice.text = "$3.50" }
        else if price == "Hand Exterior Wash" {
            txtPrice.text = "$5.00" }
        else if price ==  "Interior/Exterior Hand Wash" {
            txtPrice.text = "$7.50" }
        else if price == "Interior/Exterior Hand Wash and Wax" {
            txtPrice.text = "$11.00" }
        else if price == "Advanced Int/Ext Hand Wash and Wax" {
            txtPrice.text = "$15.00" }
    }
    
    var serviceText = ""
    var priceText = ""
    
    @IBAction func btnNext(_ sender: UIButton) {
        self.serviceText = txtService.text!
        self.priceText = txtPrice.text!
        performSegue(withIdentifier: "job", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! Picker2ViewController
        vc.receiveService = self.txtService.text!
        vc.receiveCost = self.txtPrice.text!
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnNext.isEnabled = false
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
