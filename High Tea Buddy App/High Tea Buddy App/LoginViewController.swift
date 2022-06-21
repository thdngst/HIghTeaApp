//
//  LoginViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 3/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    var email:String? {return userNameLabel.text}
    
    var password:String? {return passwordLabel.text}
       
    var users : [User]?
       
    var thisUser : User?
    
    var message1 = "User not found! Please sign up."
    var message2 = "Incorrect password! Please try again."
    var message3 = "Please enter username!"
    var message4 = "Please enter password!"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colours.bisque
        
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        loginButton.layer.masksToBounds = true
        
        settingsButton.layer.cornerRadius = settingsButton.frame.size.height / 2
        settingsButton.layer.masksToBounds = true
        
        loginButton.setGradient(colour1: Colours.darkGrey, colour2: Colours.greyOrange)
        settingsButton.setGradient(colour1: Colours.darkGrey, colour2: Colours.greyOrange)
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
       
        
        guard let email = email else {showAlert(myMessage: message3);return}
        guard let password = password else {showAlert(myMessage: message4);return}
        
        if email == "" {showAlert(myMessage: message3);return}
        if password == ""{showAlert(myMessage: message4);return}
        
        thisUser = User(email: email, password: password)
        
        let defaults = UserDefaults.standard
        
        if let allUsers = defaults.dictionary(forKey: "users") as? [String:String] {
            
            if (allUsers[email] != nil) {
                
                if allUsers[email] == password{
                    
                    performSegue(withIdentifier: "toMoodsSegue", sender: UIButton.self)
                    
                } else {showAlert(myMessage: message2); print("wrong password")}
                
                
            } else
            
            {showAlert(myMessage: message1); print("No user!")}
    
            
        } else {showAlert(myMessage: message1); print("Please sign up")}
        
        
    }
    
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
      
         performSegue(withIdentifier: "signUpSegue", sender: UIButton.self)
    }
    
     @IBAction func settingTapped(_ sender: UIButton) {
           
           performSegue(withIdentifier: "toSettingsSegue", sender: UIButton.self)
           
           
    }
    
   @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    func showAlert (myMessage : String) {
        
       let myAlert = UIAlertController(title: "Alert", message: myMessage, preferredStyle: UIAlertController.Style.alert)

       myAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

       self.present(myAlert, animated: true, completion: nil)
        
        
    }
           
    
    
       
           
           

}

 

