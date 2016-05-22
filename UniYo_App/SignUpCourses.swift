//
//  SignUpCourses.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 12/05/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation

import UIKit
import Firebase

class SignUpCourses: UIViewController {
    @IBOutlet weak var course1: UITextField!
    @IBOutlet weak var course2: UITextField!
    @IBOutlet weak var course3: UITextField!
    @IBOutlet weak var course4: UITextField!
    @IBOutlet weak var course5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func courseContinue(sender: UIButton!) {
        let c1 = course1.text
        let c2 = course2.text
        let c3 = course3.text
        let c4 = course4.text
        let c5 = course5.text
        
        
        if c1 == "" && c2 == "" && c3 == "" && c4 == "" && c5 == "" {
            showErrorAllert("At least one course required", msg: "Where are you studying?")
        } else {
            addCourse("Course 1", courseTextField: course1);
            addCourse("Course 2", courseTextField: course2);
            addCourse("Course 3", courseTextField: course3);
            addCourse("Course 4", courseTextField: course4);
            addCourse("Course 5", courseTextField: course5);
        }
    }
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func addCourse(keyName: String!, courseTextField: UITextField!) {
        if courseTextField.text != "" {
            let course: Dictionary<String, String> = [keyName: courseTextField.text!]
            DataService.ds.REF_USER_CURRENT.updateChildValues(course)
            courseTextField.text = ""
        }
    }
}