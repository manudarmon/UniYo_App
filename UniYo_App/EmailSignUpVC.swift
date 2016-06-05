//
//  EmailSignUpVC.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 25/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class EmailSignUpVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func attemptLogin(sender: UIButton!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: {(user, error) in
            
                if error != nil {
                    
                    print(error)
                    
                    if error!.code == STATUS_ACCOUNT_NONEXIST {
                        FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: {(user, error) in
                            if error != nil {
                                self.showErrorAllert("Could not create your account", msg: "Problem creating account. Try something else")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
                                
                                // ####### START SAVE DATA IN FIREBASE #######
                                
                                    let userData = ["provider": "email"]
                                    DataService.ds.createFirebaseUser(user!.uid, user: userData)
                                
                                // ####### END SAVE DATA IN FIREBASE #######
                                
                                self.performSegueWithIdentifier(SEGUE_EMAIL_SIGN_UP, sender: nil)
                                
                            }
                            
                        })
                    } else {
                        self.showErrorAllert("Could not login", msg: "Please check your username and password")
                    }
                } else {
                    self.performSegueWithIdentifier(SEGUE_EMAIL_LOG_IN, sender: nil)
                }
                
            })
            
        } else {
            showErrorAllert("Email and psw required", msg: "You must enter an email and a psw")
        }
    }
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}