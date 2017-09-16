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
    override func viewDidLoad() {
        super.viewDidLoad()
        codeTextField.delegate = self
        DatabaseManager.sharedInstance.setupDatabaseListener()

        // Do any additional setup after loading the view.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        instructorCodeExists(code: textField.text)
        textField.resignFirstResponder()
        return true
    }
    
    func instructorCodeExists(code: String?) -> Bool {
        if let codeString = code {
            
            //performSegue(withIdentifier: "showTeacherTranscript", sender: nil)
        }
        
        return false
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "showTeacherTranscript") {
            
        }
    }
 

}
