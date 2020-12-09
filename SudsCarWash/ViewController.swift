//
//  ViewController.swift
//  SudsCarWash
//
//  Created by RVC Terry on 11/18/20.
//  Copyright © 2020 RVC Terry. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var cardname: UITextField!
    @IBOutlet weak var cardnumber: UITextField!
    @IBOutlet weak var cardexp: UITextField!
    @IBOutlet weak var cardccv: UITextField!
  
    
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnEdit: UIButton!
    
    
    @IBAction func btnEdit(_ sender: UIButton) {
        
        //0a Edit contact
        firstname.isEnabled = true
        lastname.isEnabled = true
        address.isEnabled = true
        city.isEnabled = true
        state.isEnabled = true
        zip.isEnabled = true
        phone.isEnabled = true
        email.isEnabled = true
        cardname.isEnabled = true
        cardnumber.isEnabled = true
        cardexp.isEnabled = true
        cardccv.isEnabled = true
        btnSave.isHidden = false
        btnEdit.isHidden = true
        firstname.becomeFirstResponder()
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        //1 Add Save Logic
        if (contactdb != nil)
        {
            
            contactdb.setValue(firstname.text, forKey: "firstname")
            contactdb.setValue(lastname.text, forKey: "lastname")
            contactdb.setValue(address.text, forKey: "address")
            contactdb.setValue(city.text, forKey: "city")
            contactdb.setValue(state.text, forKey: "state")
            contactdb.setValue(zip.text, forKey: "zip")
            contactdb.setValue(phone.text, forKey: "phone")
            contactdb.setValue(email.text, forKey: "email")
            contactdb.setValue(cardname.text, forKey: "cardname")
            contactdb.setValue(cardnumber.text, forKey: "cardnumber")
            contactdb.setValue(cardexp.text, forKey: "cardexp")
            contactdb.setValue(cardccv.text, forKey: "cardccv")
            
        }
        else
        {
            let entityDescription =
                NSEntityDescription.entity(forEntityName: "Contact",in: managedObjectContext)
            
            let contact = Contact(entity: entityDescription!,
                                  insertInto: managedObjectContext)
            
            contact.firstname = firstname.text!
            contact.lastname = lastname.text!
            contact.address = address.text!
            contact.city = city.text!
            contact.state = state.text!
            contact.zip = zip.text!
            contact.phone = phone.text!
            contact.email = email.text!
            contact.cardname = cardname.text!
            contact.cardnumber = cardnumber.text!
            contact.cardexp = cardexp.text!
            contact.cardccv = cardccv.text!
            
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        if error != nil {
            //if error occurs
            // status.text = err.localizedFailureReason
        } else {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        
        //2) Dismiss ViewController
        self.dismiss(animated: true, completion: nil)
        //       let detailVC = ContactTableViewController()
        //        detailVC.modalPresentationStyle = .fullScreen
        //        present(detailVC, animated: false)
    }
    
    
    //3) Add ManagedObject Data Context
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //4) Add variable contactdb (used from UITableView
    var contactdb:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (contactdb != nil)
        {
            firstname.text = contactdb.value(forKey: "firstname") as? String
            lastname.text = contactdb.value(forKey: "lastname") as? String
            address.text = contactdb.value(forKey: "address") as? String
            city.text = contactdb.value(forKey: "city") as? String
            state.text = contactdb.value(forKey: "state") as? String
            zip.text = contactdb.value(forKey: "zip") as? String
            email.text = contactdb.value(forKey: "email") as? String
            phone.text = contactdb.value(forKey: "phone") as? String
            cardname.text = contactdb.value(forKey: "cardname") as? String
            cardnumber.text = contactdb.value(forKey: "cardnumber") as? String
            cardexp.text = contactdb.value(forKey: "cardexp") as? String
            cardccv.text = contactdb.value(forKey: "cardccv") as? String
            
            btnSave.setTitle("Update", for: UIControl.State())
            
            btnEdit.isHidden = false
            firstname.isEnabled = false
            lastname.isEnabled = false
            address.isEnabled = false
            city.isEnabled = false
            state.isEnabled = false
            zip.isEnabled = false
            phone.isEnabled = false
            email.isEnabled = false
            cardname.isEnabled = false
            cardnumber.isEnabled = false
            cardexp.isEnabled = false
            cardccv.isEnabled = false
            btnSave.isHidden = true
        }else{
            
            btnEdit.isHidden = true
            firstname.isEnabled = true
            lastname.isEnabled = true
            address.isEnabled = true
            city.isEnabled = true
            state.isEnabled = true
            zip.isEnabled = true
            phone.isEnabled = true
            email.isEnabled = true
            cardname.isEnabled = true
            cardnumber.isEnabled = true
            cardexp.isEnabled = true
            cardccv.isEnabled = true
        }
        firstname.becomeFirstResponder()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)
        
        if firstname.text == ""{
            btnContinue.isEnabled = false}
        if lastname.text == ""{
            btnContinue.isEnabled = false}
        if address.text == ""{
            btnContinue.isEnabled = false}
        if city.text == ""{
            btnContinue.isEnabled = false}
        if state.text == ""{
            btnContinue.isEnabled = false}
        if zip.text == ""{
            btnContinue.isEnabled = false}
        if phone.text == ""{
            btnContinue.isEnabled = false}
        if email.text == ""{
            btnContinue.isEnabled = false}
        if cardname.text == ""{
            btnContinue.isEnabled = false}
        if cardnumber.text == ""{
            btnContinue.isEnabled = false}
        if cardexp.text == ""{
            btnContinue.isEnabled = false}
        if cardccv.text == ""{
            btnContinue.isEnabled = false}
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //6 Add to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches , with:event)
        if (touches.first as UITouch?) != nil {
            DismissKeyboard()
        }
    }
    
    //7 Add to hide keyboard
    @objc func DismissKeyboard(){
        //forces resign first responder and hides keyboard
        firstname.endEditing(true)
        lastname.endEditing(true)
        address.endEditing(true)
        city.endEditing(true)
        state.endEditing(true)
        zip.endEditing(true)
        email.endEditing(true)
        phone.endEditing(true)
        cardname.endEditing(true)
        cardnumber.endEditing(true)
        cardexp.endEditing(true)
        cardccv.endEditing(true)
    }
    
    //8 Add to hide keyboard
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }
}



