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
    
    @IBOutlet weak var hiLabel: UILabel!
    
    @IBOutlet weak var whoLabel: UILabel!
    
    var hasAppearedOnce = false
    let bounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //REMOVE THIS LATER
        UserDefaults.standard.setValue(false, forKey:"_UIConstraintBasedLayoutLogUnsatisfiable")
        
        hiLabel.center = CGPoint(x: bounds.size.width / 2, y: -50)
        whoLabel.center = CGPoint(x: bounds.size.width / 2, y: -50)
        
        teacherButton.alpha = 0
        studentButton.alpha = 0

        studentButton.setBordered()
//        studentButton.layer.borderColor = UIColor(red: 0.463, green: 0.29, blue: 0.902, alpha: 1).cgColor
//        studentButton.layer.borderWidth = 3
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !hasAppearedOnce {
            hasAppearedOnce = true
            
            UIView.animate(withDuration: 2, delay: 1.5, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.hiLabel.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.size.height / 3)
                
            }, completion: { (done) in
                
                
                UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.whoLabel.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.size.height / 2.5)
                    
                }, completion: { (done) in
                    
                    UIView.animate(withDuration: 0.8, animations: { 
                        
                        self.teacherButton.alpha = 1
                        self.studentButton.alpha = 1
                        
                    })
                    
                })
                
                
            })

        }
        
        
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
