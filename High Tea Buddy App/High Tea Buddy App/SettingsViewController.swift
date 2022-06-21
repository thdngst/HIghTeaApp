//
//  SettingsViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 7/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsViewController: UIViewController {

    @IBOutlet weak var notificationLabel: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colours.bisque

        setInitialSwitchValue()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        askForPermission()
    }
    
    @IBAction func notificationLabelSwitched(_ sender: UISwitch) {
        
         if  sender.isOn {
                   
                   UserDefaults.standard.set(sender.isOn, forKey: "switchValue")
                   setNotification()
                   
                   
               } else {
                   
                   
               UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                   UserDefaults.standard.set( sender.isOn, forKey: "switchValue")        }
    }
    
    
    
    
    func setNotification() {
            
            let centre = UNUserNotificationCenter.current()
            
         
            //2. create content
            
            let content = UNMutableNotificationContent()
            content.title = "Time to grab a cuppa! ☕️"
            content.body = "Relax. We are all in this together. 👍🏻"
            
            //3 create trigger
            
         //   let date = Date().addingTimeInterval(10)
            
          //  var date = DateComponents()
            
           // date.second = 120
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
            //4 request
            
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            // rego
            centre.add(request) { (error) in
                
            }
    }
    
    func setInitialSwitchValue() {
        let defaults = UserDefaults.standard
        
        
        if let switchValue = defaults.value(forKey: "switchValue") as? Bool {
            
        notificationLabel.isOn = switchValue
            
        } else {notificationLabel.isOn = false}
    }

    
    func askForPermission(){
         let centre = UNUserNotificationCenter.current()
                   
                   centre.requestAuthorization(options: [.alert, .sound]) {
                       (granted, error) in
                   }
    }
    
     //commit to origins

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
