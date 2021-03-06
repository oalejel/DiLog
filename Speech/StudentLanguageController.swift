//
//  StudentLanguageController.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit

class StudentLanguageController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var backButton: SqueezeButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        languagePicker.dataSource = self
        languagePicker.delegate = self
        
        backButton.setBordered()
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speechLanguageCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(speechLanguageCodes.keys)[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let langString = pickerView(languagePicker, titleForRow: languagePicker.selectedRow(inComponent: 0), forComponent: 0) ?? "English"
        DatabaseManager.sharedInstance.studentLanguageCode = speechLanguageCodes[langString]
        print("language code from picker: " + DatabaseManager.sharedInstance.studentLanguageCode)
    }
    

}
