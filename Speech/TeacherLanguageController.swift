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
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    @IBOutlet weak var backButton: SqueezeButton!
    
    //please organize these alphabetically!!!
    
    
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
    
    @IBAction func rewindToTeacherLanguage(segue: UIStoryboardSegue) {
        print("rewinding to teacher lang vc")
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let langString = pickerView(languagePicker, titleForRow: languagePicker.selectedRow(inComponent: 0), forComponent: 0) ?? "English"
        DatabaseManager.sharedInstance.streamingLanguageCode = speechLanguageCodes[langString]!
        print(DatabaseManager.sharedInstance.streamingLanguageCode)
    }
 

}
