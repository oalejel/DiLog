//
//  ViewController.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var teacherButton: SqueezeButton!
    
    @IBOutlet weak var studentButton: SqueezeButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //REMOVE THIS LATER
        UserDefaults.standard.setValue(false, forKey:"_UIConstraintBasedLayoutLogUnsatisfiable")

        studentButton.setBordered()
//        studentButton.layer.borderColor = UIColor(red: 0.463, green: 0.29, blue: 0.902, alpha: 1).cgColor
//        studentButton.layer.borderWidth = 3
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToRoot(segue: UIStoryboardSegue) {
        print("unwinding")
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
