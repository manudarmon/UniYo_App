//
//  DataService.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 25/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation
import Firebase


let URL_BASE = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()

        var REF_BASE = URL_BASE
        var REF_USERS = URL_BASE.child("users")
    
        var REF_USER_CURRENT : FIRDatabaseReference {
            let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
            let user = REF_BASE.child("users").child(uid)
            return user
        }
        
        func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
            REF_USERS.child(uid).setValue(user)
        }
}