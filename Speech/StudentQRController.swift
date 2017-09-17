//
//  StudentQRController.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit

class StudentQRController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var qrView: UIView!
    
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var submitButton: SqueezeButton!
    @IBOutlet weak var backButton: SqueezeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTextField.delegate = self

        // Do any additional setup after loading the view.
        
        backButton.setBordered()
        
        codeTextField.layer.cornerRadius = 5
        codeTextField.layer.masksToBounds = true
        
        codeTextField.layer.borderColor = ThemePurple.cgColor
        codeTextField.layer.borderWidth = 3
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func unwindToCodeController(segue: UIStoryboardSegue) {
        print("unwinding")
    }
    
    @IBAction func submitPressed(_ sender: SqueezeButton) {
        
        DatabaseManager.sharedInstance.instructorCode = codeTextField.text!
        //if we have a functional code
        instructorCodeExists(code: codeTextField.text, closure: {
            self.performSegue(withIdentifier: "showLanguagePicker", sender: self)
        })
    }
    
    
    func instructorCodeExists(code: String?, closure: @escaping () -> Void) {
        if let codeString = code {
            DatabaseManager.sharedInstance.ref.child("instructors").observeSingleEvent(of: .value, with: { (snapshot) in
                
                print("))))))))))))))))))))))))")
                
                print(snapshot.value!)
                let dict = snapshot.value! as! NSDictionary
                print(dict.object(forKey: codeString) ?? "seseseses")
                if dict.object(forKey: codeString) != nil {
                    closure()
                }
                
                
            }, withCancel: { (error) in
                print(error)
            })
            
            
        }
    }

    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showLanguagePicker" {
             return false //return false for now
        }
        
        return true
    }
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            DatabaseManager.sharedInstance.setupDatabaseListener()
            
            
    }
 

}
