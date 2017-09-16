//
//  StudentQRController.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit
import AVFoundation

class StudentQRController: UIViewController {
    @IBOutlet weak var qrView: UIView!
    
    var captureSession: AVCaptureSession?
    var previewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        captureSession = AVCaptureSession()
//        let captureInput = AVCaptureInput()
//        captureSession?.addInput(captureInput)
//        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//        previewLayer?.frame = qrView.frame
        
//        view.layer.addSublayer(previewLayer!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
