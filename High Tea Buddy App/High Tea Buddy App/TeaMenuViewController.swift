//
//  TeaMenuViewController.swift
//  High Tea Buddy App
//
//  Created by Rebecca on 3/6/20.
//  Copyright © 2020 iOS Buddy. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexaString: String, alpha: CGFloat = 1.0) {
        var hexInt: UInt64 = 0
        let scanner = Scanner(string: hexaString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&hexInt)
        
        let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0
        let alpha = alpha
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

class TeaMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var teas: [Tea] = []

    let reuseIdentifier = "cell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [Tea.TeaTypes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colours.bisque
        
        navigationItem.title = "Tea Menu"
        
        print(teas)
        
        if teas.count == 0 {
            navigationItem.title = "No Tea Available"
        } else if teas.count == 1 {
            data = teas[0].teaTypes
        } else {
            for tea in teas {
                data.append(contentsOf: tea.teaTypes)
            }
        }
        self.collectionView.backgroundColor = Colours.bisque
        self.collectionView.collectionViewLayout = self.getLayout()

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.collectionView.indexPathForItem(at: sender.location(in: self.collectionView)) {
            navView(index: indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        self.view.backgroundColor = Colours.bisque
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! TeaCollectionViewCell
        cell.myLabel.text = data[indexPath.item].name
        cell.myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.myLabel.numberOfLines = 0
        cell.myLabel.textColor = .white
        cell.myLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        cell.contentView.layer.cornerRadius = 2.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        //SET GRADIENT COLOR
        let colors = cellRandomBackgroundColors()
        let gradient = CAGradientLayer()
        gradient.frame = cell.bounds
        gradient.colors = [colors[0], colors[1]]
        gradient.cornerRadius = 10
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.1, y: 0.5)
        
        //SET GRADIENT INDEX TO 0 AND APPLY
        let bgIndex: UInt32 = 0
        cell.clipsToBounds = true
        cell.layer.insertSublayer(gradient, at: bgIndex)
                
        //SET SHADOW TO EACH CELL
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        cell.layer.cornerRadius = 10
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.cancelsTouchesInView = false
        cell.addGestureRecognizer(tap)
        
        return cell
    }
    
    func getLayout() -> UICollectionViewLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 50)
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        layout.itemSize = CGSize(width: width * 0.4, height: height * 0.2)
        
        return layout as UICollectionViewLayout
    }
    
    func cellRandomBackgroundColors() -> [CGColor] {
        //Colors
        let red = [#colorLiteral(red: 0.9654200673, green: 0.1590853035, blue: 0.2688751221, alpha: 1).cgColor,#colorLiteral(red: 0.7559037805, green: 0.1139892414, blue: 0.1577021778, alpha: 1).cgColor]
        let orangeRed = [#colorLiteral(red: 0.9338900447, green: 0.4315618277, blue: 0.2564975619, alpha: 1).cgColor,#colorLiteral(red: 0.8518816233, green: 0.1738803983, blue: 0.01849062555, alpha: 1).cgColor]
        let orange = [#colorLiteral(red: 0.9953531623, green: 0.54947716, blue: 0.1281470656, alpha: 1).cgColor,#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1).cgColor]
        let yellow = [#colorLiteral(red: 0.9409626126, green: 0.7209432721, blue: 0.1315650344, alpha: 1).cgColor,#colorLiteral(red: 0.8931249976, green: 0.5340107679, blue: 0.08877573162, alpha: 1).cgColor]
        let green = [#colorLiteral(red: 0.3796315193, green: 0.7958304286, blue: 0.2592983842, alpha: 1).cgColor,#colorLiteral(red: 0.2060100436, green: 0.6006633639, blue: 0.09944178909, alpha: 1).cgColor]
        let greenBlue = [#colorLiteral(red: 0.2761503458, green: 0.824685812, blue: 0.7065336704, alpha: 1).cgColor,#colorLiteral(red: 0, green: 0.6422213912, blue: 0.568986237, alpha: 1).cgColor]
        let kindaBlue = [#colorLiteral(red: 0.2494148612, green: 0.8105323911, blue: 0.8425348401, alpha: 1).cgColor,#colorLiteral(red: 0, green: 0.6073564887, blue: 0.7661359906, alpha: 1).cgColor]
        let skyBlue = [#colorLiteral(red: 0.3045541644, green: 0.6749247313, blue: 0.9517192245, alpha: 1).cgColor,#colorLiteral(red: 0.008423916064, green: 0.4699558616, blue: 0.882807076, alpha: 1).cgColor]
        let blue = [#colorLiteral(red: 0.1774400771, green: 0.466574192, blue: 0.8732826114, alpha: 1).cgColor,#colorLiteral(red: 0.00491155684, green: 0.287129879, blue: 0.7411141396, alpha: 1).cgColor]
        let bluePurple = [#colorLiteral(red: 0.4613699913, green: 0.3118675947, blue: 0.8906354308, alpha: 1).cgColor,#colorLiteral(red: 0.3018293083, green: 0.1458326578, blue: 0.7334778905, alpha: 1).cgColor]
        let purple = [#colorLiteral(red: 0.7080290914, green: 0.3073516488, blue: 0.8653779626, alpha: 1).cgColor,#colorLiteral(red: 0.5031493902, green: 0.1100070402, blue: 0.6790940762, alpha: 1).cgColor]
        let pink = [#colorLiteral(red: 0.9495453238, green: 0.4185881019, blue: 0.6859942079, alpha: 1).cgColor,#colorLiteral(red: 0.8123683333, green: 0.1657164991, blue: 0.5003474355, alpha: 1).cgColor]
        
        let colorsTable: [Int: [CGColor]] = [0: red, 1: orangeRed, 2: orange, 3: yellow, 4: green, 5: greenBlue, 6: kindaBlue, 7: skyBlue, 8: blue, 9: bluePurple, 10: bluePurple, 11: purple, 12: pink]
        
        let randomColors = colorsTable.values.randomElement()
        return randomColors!
    }
    
    func navView(index: Int) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newView = storyBoard.instantiateViewController(identifier: "TeaDetailViewController") as! TeaDetailViewController
        
        newView.selectedData = data[index]
        navigationController?.pushViewController(newView, animated: true)
    }
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
