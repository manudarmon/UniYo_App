//
//  SignUpStudyfield.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 03/05/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class SignUpStudyField: UIViewController {
    @IBOutlet weak var studyField1: UITextField!
    @IBOutlet weak var studyField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func studyFieldContinue(sender: UIButton!) {
        let sField1 = studyField1.text
        let sField2 = studyField2.text
        
        
        if sField1 == "" && sField2 == "" {
            showErrorAllert("At least one sf required", msg: "What are you studying?")
        } else {
            addStudyField("Study field 1", studyTextField: studyField1);
            addStudyField("Study field 2", studyTextField: studyField2);
        }
    }
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func addStudyField(keyName: String!, studyTextField: UITextField!) {
        if studyTextField.text != "" {
            let course: Dictionary<String, String> = [keyName: studyTextField.text!]
            DataService.ds.REF_USER_CURRENT.updateChildValues(course)
            studyTextField.text = ""
        }
    }
}