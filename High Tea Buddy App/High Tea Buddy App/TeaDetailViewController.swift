//
//  TeaDetailViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 6/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit
import AVFoundation

class TeaDetailViewController: UIViewController {
    var selectedData = Tea.TeaTypes(name: "", timer: 1, desc: "", instruction: "")
    
    @IBOutlet weak var teaName: UILabel!
    @IBOutlet weak var teaImage: UIImageView!
    @IBOutlet weak var teaDesc: UILabel!
    @IBOutlet weak var teaInsuct: UILabel!
    @IBOutlet weak var teaTimer: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var totalSecond: Int = 0
    var timer: Timer?
    var startTimer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TEA NAME=====", selectedData.name)
        initImage()
        
        teaName.text = selectedData.name
        teaName.lineBreakMode = NSLineBreakMode.byWordWrapping
        teaName.numberOfLines = 0
        
        teaDesc.text = selectedData.desc
        teaDesc.lineBreakMode = NSLineBreakMode.byWordWrapping
        teaDesc.numberOfLines = 0
        
        teaInsuct.text = selectedData.instruction
        teaInsuct.lineBreakMode = NSLineBreakMode.byWordWrapping
        teaInsuct.numberOfLines = 0
        
        teaTimer.text = timeString(time: TimeInterval(selectedData.timer))
        totalSecond = selectedData.timer
        
        navigationItem.title = "Tea Detail and Instruction"
    }
    
    func initImage() {
        
        switch selectedData.name {
        case "Assam":
            teaImage.image = UIImage(named: "assam")
            break
        case "Earl Grey":
            teaImage.image = UIImage(named: "earl grey")
            break
        case "Genmaicha":
            teaImage.image = UIImage(named: "genmaicha")
            break
        case "English Breakfast":
            teaImage.image = UIImage(named: "english breakfast")
            break
        case "Buddha’s Dream":
            teaImage.image = UIImage(named: "buddha's dream")
            break
        case "Jasmine Pearl":
            teaImage.image = UIImage(named: "dragon pearls")
            break
        case "Forty Winks":
            teaImage.image = UIImage(named: "forty winks")
            break
        case "White Peony":
            teaImage.image = UIImage(named: "white peony")
            break
        case "Silver Needle":
            teaImage.image = UIImage(named: "silver needle")
            break
        default:
            teaImage.image = UIImage(named: "1024")
            break
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%2i:%02i", minutes, seconds)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if startTimer {
            startBtn.setTitle("Start", for: .normal)
            startTimer = false
            timer?.invalidate()
        } else {
            runTimer()
            startTimer = true
            startBtn.setTitle("Pause", for: .normal)
        }
    }
    
    @objc func updateTimer() {
        totalSecond -= 1
        teaTimer.text = timeString(time: TimeInterval(totalSecond))
        
        if totalSecond == 0 {
            
            startTimer = false
            startBtn.setTitle("Start", for: .normal)
            
            timer?.invalidate()
            AudioServicesPlaySystemSound(1031)
            
            let alert = UIAlertController(title: "Tea is done!", message: "Enjoy your tea", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {action in
                AudioServicesDisposeSystemSoundID(1031)
            }))
            
            self.present(alert, animated: true)
            teaTimer.text = timeString(time: TimeInterval(selectedData.timer))
            totalSecond = selectedData.timer
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
}
