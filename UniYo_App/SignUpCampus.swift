//
//  SignUp_1.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 27/04/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class SignUpCampus: UIViewController {
    @IBOutlet weak var campusField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func campusContinue(sender: UIButton!) {
        if let campusWhiteSpace: String = campusField.text where campusWhiteSpace != "" {
            let campus = campusWhiteSpace.stringByReplacingOccurrencesOfString(" ", withString: "")
            addCampus(campus)
        } else {
            showErrorAllert("Campus required", msg: "Where are you studying?")
        }
    }
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func addCampus(campus: String!) {
        let campus: Dictionary <String, String> = ["Campus": campusField.text!]
        DataService.ds.REF_USER_CURRENT.updateChildValues(campus)
        campusField.text = ""
    }
}