//
//  TeacherLanguageController.swift
//  speak2me
//
//  Created by Omar Al-Ejel on 9/15/17.
//  Copyright © 2017 Omar Al-Ejel. All rights reserved.
//

import UIKit

class TeacherLanguageController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //TODO: implement teh text field capability later
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    var languageCodes = ["English":"en-US", "Spanish (Español)":"es-MX", "French (Français)":"fr-FR", "German (Deutsch)":"de-DE", "Mandarin (國語 (台灣))":"cmn-Hant-TW"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        languagePicker.dataSource = self
        languagePicker.delegate = self
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageCodes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(languageCodes.keys)[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func rewindToTeacherLanguage(segue: UIStoryboardSegue) {
        print("rewinding to teacher lang vc")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
