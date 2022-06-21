//
//  HomeViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 9/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colours.bisque
        
        // Button styles
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        loginButton.layer.masksToBounds = true
        
        signupButton.layer.cornerRadius = signupButton.frame.size.height / 2
        signupButton.layer.masksToBounds = true
        
        loginButton.setGradient(colour1: Colours.darkGrey, colour2: Colours.greyOrange)
        signupButton.setGradient(colour1: Colours.darkGrey, colour2: Colours.greyOrange)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
