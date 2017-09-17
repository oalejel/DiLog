//
//  LanguageSpeaker.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/17/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit
import AVFoundation

class LanguageSpeaker: NSObject {
    
     @objc static let sharedInstance: LanguageSpeaker! = LanguageSpeaker()

    
    var pendingUtterances: [AVSpeechUtterance] = []
    let synthesizer = AVSpeechSynthesizer()
    
    
    override init() {
        super.init()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if self.pendingUtterances.count > 0 && !self.synthesizer.isSpeaking {
                self.synthesizer.speak(self.pendingUtterances[0])
                self.pendingUtterances.remove(at: 0)
            }
        }
        
    }

    
    func speak(s: String, language: String) {
        let utterance = AVSpeechUtterance(string: s)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        
        if synthesizer.isSpeaking {
            pendingUtterances.append(utterance)
        }
        
        //        utterance.pitchMultiplier = slider.value
        synthesizer.speak(utterance)
    }
    
    
    
}
