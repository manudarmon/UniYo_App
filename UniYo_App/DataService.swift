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
    
    private var _REF_BASE = URL_BASE
    private var _REF_USERS = URL_BASE.child("users")
    
    var REF_BASE : FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS : FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_USER_CURRENT : FIRDatabaseReference {
        let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
        let user = URL_BASE.child("users").child(uid)
        return user
    }
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(user)
    }
    
}