//
//  DatabaseManager.swift
//  Speech
//
//  Created by Omar Al-Ejel on 9/16/17.
//  Copyright © 2017 Google. All rights reserved.
//

import UIKit
import Firebase


@objc class DatabaseManager: NSObject {
    @objc static let sharedInstance: DatabaseManager! = DatabaseManager()
    //do not use this in student mode – you should eventually make this code safer
    @objc public var streamingLanguageCode: String! = "en-US"
    @objc public var studentLangaugeCode: String! = "es-MX"
    
    var translater: ROGoogleTranslate!
    
    
    var ref: DatabaseReference!
    var lastEntryIndex = 0
    let instructorCode = "a2b446"
    
    var transcriptArray: [String:String] = [:]
    
    override init() {
        ref = Database.database().reference()
    }
    
    @objc public func setupDatabaseEntry() {
        ref.child("instructors").child(instructorCode)
    }
    
    func setupDatabaseListener() {
         translater = ROGoogleTranslate()
        
        ref.child("instructors").child(instructorCode).observe(.childAdded, with: { (snapshot) in
            let untranslatedString = (snapshot.value as! String)
            print("snapshot key: " + untranslatedString)
            
            
            
            
            // NEED TO GET THE SPEAKER's LANGUAGE ON START!!!
            let teacherLang = self.streamingLanguageCode//WARNING
            
            
            
            let params = ROGoogleTranslateParams(source: teacherLang!, target: self.studentLangaugeCode, text: untranslatedString)
            self.translater.translate(params: params, callback: { (translatedString) in
                print("> TRANSLATED" + translatedString)
            })
        })
    }
    
    @objc public func post(text: String) {
        transcriptArray["\(lastEntryIndex)"] = text
///!!!make this line not have to reset the entire array every tiem -- NOT EFFICENT!!
        ref.child("instructors").child(instructorCode).setValue(transcriptArray)
        lastEntryIndex += 1
    }
    
    
//    func sendTranscriptClip
}
