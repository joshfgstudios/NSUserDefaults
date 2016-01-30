//
//  ViewController.swift
//  UserDefaults
//
//  Created by Joshua Ide on 29/01/2016.
//  Copyright © 2016 Fox Gallery Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var people = [Person]()
    
    @IBOutlet weak var lblFav: UILabel!
    
    @IBAction func onPressRed(sender: AnyObject) {
        lblFav.text = "Favourite Color: Red"
        NSUserDefaults.standardUserDefaults().setValue("red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func onPressYellow(sender: AnyObject) {
        lblFav.text = "Favourite Color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func onPressBlue(sender: AnyObject) {
        lblFav.text = "Favourite Color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            lblFav.text = "Favourite Color: \(color)"
        } else {
            lblFav.text = "Pick a color!"
        }
        
        let personA = Person(first: "Wing", last: "Chun")
        let personB = Person(first: "Lady", last: "GaGa")
        let personC = Person(first: "Muffin", last: "Beiber")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }




}

