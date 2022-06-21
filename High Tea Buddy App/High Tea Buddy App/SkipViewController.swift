//
//  SkipViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 7/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit

class SkipViewController: UIViewController {

    @IBOutlet var teaButtons: [UIButton]!
   
    var teaSelected : [Tea] = []
    var teas:[Tea]? = []
    
    var greenAwake = Tea(name: "Green Tea", teaTypes: [], mood: "Awake")
       

    var greenRelax = Tea(name: "Green Tea", teaTypes: [], mood: "Relax")

    var blackFocus = Tea(name: "Black Tea", teaTypes: [], mood: "Focus")
      
    var blackAwake = Tea(name: "Black Tea", teaTypes: [], mood: "Awake")
     

    var whiteRelax = Tea(name: "White Tea", teaTypes: [], mood: "Relax")
    
    
          // Green
     var t1 = Tea.TeaTypes(name: "Genmaicha", timer: 90, desc: "Genmai Cha is a classic Japanese green tea, blended with toasted, popped rice. Originally created to stretch short supplies of tea, now enjoyed by tea lovers here and abroad. Warm and nutty taste, with a lovely savory quality.", instruction: "1 teaspoon/ 1 cup water 82°C")

     var t2 = Tea.TeaTypes(name: "Forty Winks", timer: 240, desc: "Using a blend of herbs known to promote healthy sleep, 40 Winks will round out your day and carry you into the sweetest of dreams. One cup before bed makes for an ideal way to unwind and lull yourself into a deep slumber.", instruction: "2 teaspoon / 1 cup water 100°C")

     var t3 = Tea.TeaTypes(name: "Jasmine Pearl", timer: 30, desc: "Jasmine Pearls are perfumy, hand-rolled jewels of tea from Fuding, in Fujian province, China. When added to hot water, Jasmine Phoenix Pearls majestically unfurl, releasing their delicate scent and flavor.", instruction: "1 teaspoon/ 1 cup water 80°C")

     // black
     var t4 = Tea.TeaTypes(name: "Earl Grey", timer: 180, desc: "Earl Grey is a Sri Lankan black tea combined with the citrus delights of bergamot, generating an elegant and balanced full flavoured cup. This earl grey tea is an afternoon tea essential. Perfect by itself, or with a dash of milk.", instruction: "1 teaspoon/ 1 cup water 100°C")

     var t5 = Tea.TeaTypes(name: "English Breakfast", timer: 180, desc: "English Breakfast is a full-bodied black tea blend that goes well with a traditional English breakfast. This tea is prized for its rich, slightly smoky flavor and perfectly 'on point' astringency. Balanced, very honeyed aroma. May be enjoyed plain or with a drop of milk.", instruction: "1 teaspoon/ 1 cup water 100°C")

     var t6 = Tea.TeaTypes(name: "Assam", timer: 150, desc: "Bold, powerful black tea from the Assam region of India, the perfect cup for a caffeine hit! A deep, burgundy-red cup and roasted grain aroma, malty-rich flavor with notes of raisins. Pungent but smooth astringency, making this tea an ideal cup to pair with milk and sugar.", instruction: "1 teaspoon/ 1 cup water 100°C")

     // white
     var t7 = Tea.TeaTypes(name: "White Peony", timer: 120, desc: "Also known as Bai Mu Dan, White Peony is a sweet, mild Chinese tea made from unopened tea buds, as well as the two newest leaves to sprout. Clean, succulent floral-fruit flavor, melon sweetness, a touch of gentle savoriness and rounded mouthfeel.", instruction: "2 teaspoon/ 1 cup water 80°C")



     var t8 = Tea.TeaTypes(name: "Silver Needle", timer: 20, desc: "Silver Needle (or Bai Hao Yin Zhen) is one of the most revered of Chinese teas. Gathered only for a few days in early spring, the dedication to perfection is evident in the pale, ivory-colored liquor. Silver Needle feels refreshing, soft and airy on the palate.", instruction: "1 teaspoon/ 1 cup water 80°C 1.Rinse the tea leaves with 80°C  water. 2.Pour out the first brew. 3.Gently pour in 80°C water. 4.Brew for 20 - 30 seconds.")

     var t9 = Tea.TeaTypes(name: "Buddha’s Dream", timer: 120, desc: "A soft blend of white and green tea, with accents of floral, fruit flavors this is a contemplative tea that is sure to bring a bit of enlightenment to your day.", instruction: "1 teaspoon/ 1 cup water 80°C")
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colours.bisque
        
        navigationItem.title = "Tea Types"

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        addUpTeas()
        
        //REMOVE PREVIOUSLY SELECTED TEA
        if teaSelected.count > 0 {
           teaSelected.removeAll()
        }
    }
    
    @IBAction func teaTapped(_ sender: UIButton) {
        
        for tea in teas! {
                          
            if tea.name == sender.titleLabel?.text{
                              
                teaSelected.append(tea)
                              
                              
            }
                          
        }
                      
                      
        performSegue(withIdentifier: "toTeasForDetailsSegue", sender: teaSelected)
        
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
        if segue.identifier == "toTeasForDetailsSegue" {
            
            let teaVc = segue.destination as! TeaMenuViewController
         
         
              if let teas = sender as? [Tea] {
             
             
                 teaVc.teas = teas
                 
                 
             }
             
             
        }
    }
       
     func addUpTeas() {
           
        greenAwake.teaTypes = [t1]
        greenRelax.teaTypes = [t2, t3]
        blackFocus.teaTypes = [t4, t6]
        blackAwake.teaTypes = [t5]
        whiteRelax.teaTypes = [t7, t8, t9]
           
        teas = [greenRelax, greenAwake, blackAwake, blackFocus, whiteRelax]
           
     }
    

}
