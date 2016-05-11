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
            showErrorAllert("Campus required", msg: "Where are you studying?")
        } else if sField1 != "" && sField2 == "" {
            addStudyField1(sField1)
        } else if sField1 == "" && sField2 != "" {
            addStudyField2(sField2)
        } else if sField1 != "" && sField2 != "" {
            addStudyField1(sField1)
            addStudyField2(sField2)
        }
    }
    
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func addStudyField1(sField1: String!) {
        let sField1: Dictionary<String, String> = ["Study field 1": studyField1.text!]
        DataService.ds.REF_USER_CURRENT.updateChildValues(sField1)
        studyField1.text = ""
    }
    
    func addStudyField2(sField2: String!) {
        let sField2: Dictionary<String, String> = ["Study field 2": studyField2.text!]
        DataService.ds.REF_USER_CURRENT.updateChildValues(sField2)
        studyField2.text = ""
    }

    
}