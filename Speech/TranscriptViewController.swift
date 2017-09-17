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
        textView.text.append(s)
    }


    
    @IBAction func exitPressed(_ sender: SqueezeButton) {
        DatabaseManager.sharedInstance.transcriptController = nil
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
