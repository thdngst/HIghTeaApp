//
//  SignupViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 3/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit
import Foundation

class SignupViewController: UIViewController {

    
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signupButton: UIButton!

    
    var email: String? {return usernameLabel.text}
    var password:String? {return passwordLabel.text}
    var user : User?
    var usersDiction = [String:String]()
    var message3 = "Please enter username!"
    var message4 = "Please enter password!"
    var message5 = "Please enter an valid email!"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colours.bisque
        
        signupButton.layer.cornerRadius = signupButton.frame.size.height / 2
        signupButton.layer.masksToBounds = true
        
        signupButton.setGradient(colour1: Colours.darkGrey, colour2: Colours.greyOrange)
        
    }
    

    @IBAction func signInTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backToLoginSegue", sender: UIButton.self)
    }

//    @IBAction func signUpTapped(_ sender: UIButton) {
//    }
    @IBAction func signUpTapped(_ sender: UIButton) {
        
        guard let email = email else {print("Please enter email");return}
        guard  let password = password else {print("Please enter password");return}
             
        if email == "" {showAlert(myMessage: message3);return}
        if password == ""{showAlert(myMessage: message4);return}
        
        if isValid(email: email) {
        
            user = User(email: email, password: password)
          
            let defaults = UserDefaults.standard
         
            if var retrievedUsers = defaults.dictionary(forKey: "users") as? [String:String] {
              
              retrievedUsers.updateValue(password, forKey: email)
              
              defaults.set(retrievedUsers, forKey: "users")
             
              print("2",defaults.value(forKey: "users")!)
              
            } else {
              usersDiction.updateValue(password, forKey: email)
              defaults.set(usersDiction, forKey: "users")

              print("1",defaults.value(forKey: "users")!)
            }
              
        performSegue(withIdentifier: "backToLoginSegue", sender: UIButton.self)
            
        } else {
        
          showAlert(myMessage: message5)
            
       }
    }
        
    
    
    
      func showAlert (myMessage : String) {
        
        let myAlert = UIAlertController(title: "Alert", message: myMessage, preferredStyle: UIAlertController.Style.alert)

        myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(myAlert, animated: true, completion: nil)
        
        
      }
    
      func isValid(email: String) -> Bool {
         
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
         
         let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
         return emailTest.evaluate(with: email)
     }

}
