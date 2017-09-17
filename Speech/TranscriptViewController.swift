//
//  TranscriptViewController.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit

class TranscriptViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var exitButton: SqueezeButton!
    
    var numSentences = 0
    
    var lastTextAppendMillis = Date().timeIntervalSince1970
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.layer.cornerRadius = 10
        textView.layer.masksToBounds = false
        
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.shadowOffset = CGSize(width: 0, height: 0)
        textView.layer.shadowRadius = 10
        textView.layer.shadowOpacity = 0.3
        
        exitButton.setBordered()
        
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 8)
        
        DatabaseManager.sharedInstance.transcriptController = self
    }
    

    func addToTextField(s: String) {
        LanguageSpeaker.sharedInstance.speak(s: s, language: DatabaseManager.sharedInstance.studentLanguageCode)
        
        var characters = Array(s.characters)
        let char1 = characters[0]
        let upperChar1 = "\(char1)".uppercased()
        characters[0] = Array(upperChar1.characters)[0]
        
        var reformattedString = ""
        for c in characters {
            reformattedString.append(c)
        }
        
        reformattedString.append(". ")
        
        if numSentences % 3 == 0 && numSentences != 0 {
            reformattedString.append("\n\n")
        }
        
        DispatchQueue.main.async {
            self.textView.text.append(reformattedString)
        }
        
        numSentences += 1
    }


    
    @IBAction func exitPressed(_ sender: SqueezeButton) {
        DatabaseManager.sharedInstance.transcriptController = nil
        LanguageSpeaker.sharedInstance.pendingUtterances = []
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
