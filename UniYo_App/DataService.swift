//
//  DataService.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 25/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation
import Firebase


let URL_BASE = "https://uniyo.firebaseio.com/"

class DataService {
    static let ds = DataService()

        private var _REF_BASE = Firebase(url: "\(URL_BASE)")
        private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
        var REF_BASE : Firebase {
            return _REF_BASE
        }
        
        var REF_USERS : Firebase {
            return _REF_USERS
        }
    
        var REF_USER_CURRENT : Firebase {
            let uid = NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) as! String
            let user = Firebase(url: "\(URL_BASE)").childByAppendingPath("users").childByAppendingPath(uid)
            return user!
        }
        
        func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
            REF_USERS.childByAppendingPath(uid).setValue(user)
        }

    
    
//ADD CAMPUS NAMES LIST IN FIREBASE
//private var _REF_CAMPUSES = Firebase(url: "\(URL_BASE)/campuses")
//var REF_CAMPUSES : Firebase {
//return _REF_CAMPUSES
//}

}