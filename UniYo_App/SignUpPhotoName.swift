//
//  SignUpPhotoName.swift
//  UniYo_App
//
//  Created by Emmanuel Darmon on 02/06/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class SignUpPhotoName: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var firstlastname: UITextField!
    @IBOutlet weak var imageSelectorImage: UIImageView!

    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        presentViewController(imagePicker, animated: true, completion: nil)
        }
    
    let storage = FIRStorage.storage()
    let storageRef = FIRStorage.storage().referenceForURL("gs://project-693707092233493332.appspot.com")
    func configureStorage() {
        storageRef
    }
    
    @IBAction func photoNameContinue(sender: UIButton!) {
        
        // SAVE imagePicker in Firebase Storage
        
        let uName = firstlastname.text
        if uName == ""  {
            showErrorAllert("What is your name ?", msg: "We need your full name.")
        } else {
            addName("Name", nameTextField: firstlastname);
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imageSelectorImage.image = image
    }
    
    func addName(keyName: String!, nameTextField: UITextField!) {
        let name: Dictionary<String, String> = [keyName: nameTextField.text!]
        DataService.ds.REF_USER_CURRENT.updateChildValues(name)
        nameTextField.text = ""
    }
    
    func showErrorAllert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
}