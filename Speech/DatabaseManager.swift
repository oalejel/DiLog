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
    @objc public var streamingLanguageCode: String = "en-US"
    @objc public var studentLanguageCode: String! = "es-MX"
    
    var translater: ROGoogleTranslate!
    
    var transcriptController: TranscriptViewController? = nil
    
    var ref: DatabaseReference!
    var lastEntryIndex = 0
    //this code is just a default value!
    @objc public var instructorCode = "a2b446"
    
    var transcriptDict: [String:String] = [:]
    
    override init() {
        ref = Database.database().reference()
    }
    
    @objc public func setupDatabaseEntry() {
        instructorCode = generateKey(length: 6)
        transcriptDict["lang"] = streamingLanguageCode
        ref.child("instructors").child(instructorCode).setValue(["lang":streamingLanguageCode])
    }
    
    @objc public func clearSession() {
        ref.child("instructors").child(instructorCode).removeValue()
    }
    
     func generateKey(length: Int) -> String {
        let characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "9"]
        
        var outputKey = ""
        
        for _ in 0..<length {
            outputKey += characters[Int(arc4random()) % characters.count]
        }
        
        return outputKey
    }
    
    func setupDatabaseListener() {
         translater = ROGoogleTranslate()
        
        //setup streamingLanguageCode
//        let langDatabaseRef = ref.child("instructors").child(instructorCode).child("lang").key
//        print("&&&&" + langDatabaseRef)
        
//        streamingLanguageCode = (ref.child("instructors").child(instructorCode).child("lang") as? String) ?? "en-US"
//        print("----- THE LANGUAGE CODE::::: " + streamingLanguageCode);
        //ref.child("instructors").observeSingleE
        ref.child("instructors").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let d = snapshot.value as! [String:[String:String]]
            print(d[self.instructorCode])
//            self.streamingLanguageCode = arr.object(forKey: "lang") as? String ?? "en-US"
            self.streamingLanguageCode = d[self.instructorCode]!["lang"]!
            print("our langauge is: ")
            print(self.streamingLanguageCode)//((snapshot.value as! NSArray).object(at: ) as? String ?? "errrrrrr"))
        }) { (error) in
            print(error)
        }
        
        ref.child("instructors").child(instructorCode).observe(.childAdded, with: { (snapshot) in
            let untranslatedString = (snapshot.value as! String)
            print("utranslated input: " + untranslatedString)
            
            let params = ROGoogleTranslateParams(source: self.streamingLanguageCode, target: self.studentLanguageCode, text: untranslatedString)
            self.translater.translate(params: params, callback: { (translatedString) in
                print("> TRANSLATED" + translatedString)
                
                if let tc = self.transcriptController {
                    tc.addToTextField(s: translatedString)
                }
            })
        })
    }
    
    @objc public func post(text: String) {
        transcriptDict["\(lastEntryIndex)"] = text
///!!!make this line not have to reset the entire array every tiem -- NOT EFFICENT!!
        ref.child("instructors").child(instructorCode).setValue(transcriptDict)
        lastEntryIndex += 1
    }
    
//    func sendTranscriptClip
}
