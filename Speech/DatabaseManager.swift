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
    
    var ref: DatabaseReference!
    var lastEntryIndex = 0
    let instructorCode = "a2b446"
    
    override init() {
        ref = Database.database().reference()
    }
    
    @objc public func setupDatabaseEntry() {
        ref.child("instructors").child(instructorCode).setValue(["\(lastEntryIndex)":"hello dude"])
        lastEntryIndex += 1
    }
    
    func setupDatabaseListener() {
        ref.child("instructors").child(instructorCode).observe(.childAdded, with: { (snapshot) in
            print(snapshot)
        })
    }
    
    @objc public func post(response: StreamingRecognizeResponse) {
        
        ref.child("instructors").child(instructorCode).setValue(["\(lastEntryIndex)":"text"])
        lastEntryIndex += 1
    }
    
    
//    func sendTranscriptClip
}
