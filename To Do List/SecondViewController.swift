//
//  SecondViewController.swift
//  To Do List
//
//  Created by Nadia on 8/2/17.
//  Copyright © 2017 Serg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addItemField: UITextField!
    
    @IBAction func AddPressed(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")  // pulling back items from permanent storage saved earlier
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(addItemField.text!)
            
        } else {
            
            items = [addItemField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")  // saving to permanent storage
        
        addItemField.text = "" //re-seting text field to be empty to add new items
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// Shutting down keyboard when user taps out of the textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
// Shutting down the keyboard when user preses Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
     
}

