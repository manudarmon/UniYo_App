//
//  ViewController.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 07/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier(SEGUE_LOG_IN, sender: nil)
        }
    }
    
    @IBAction func BtnFbkPressed(sender: UIButton!) {
        
        // ####### FACEBOOK LOGIN START #######
        let ref = URL_BASE
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], handler: {
            (facebookResult, facebookError) -> Void in
            
            if facebookError != nil {
                print("Facebook login failed. Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken)
                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                        if error != nil {
                            print("Login failed. \(error)")
                        } else {
                            print("Logged in! \(user!.uid)")
                            // ####### FACEBOOK LOGIN END #######
                            
                            // ####### STORING USER DATA START #######
                            DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { (user, error) in
                                
                                if error != nil {
                                    print("Login failed. \(error)")
                                } else {
                                    print("Loged in!\(user!.uid)")
                                    
                                    let user = ["provider": user!.provider!]
                                    DataService.ds.createFirebaseUser(user!.uid, user: user!.uid)
                                    
                                    NSUserDefaults.standardUserDefaults().setValue(user!.uid, forKey: KEY_UID)
                                    self.performSegueWithIdentifier(SEGUE_SIGN_UP, sender: nil)
                                }
                                // ####### STORING USER DATA END #######
                                
                            })
                        }
                }
            }
        })
        
    }
    
}