//
//  DescriptionViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit
import CoreData

class DescriptionViewController: UIViewController, UITextFieldDelegate, UIApplicationDelegate {
    
    var newSelfie : Selfie?

    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var outputText: UILabel!
    @IBOutlet weak var selfieInfo: UILabel!
    
    @IBAction func save(sender: AnyObject) {
        newSelfie!.note = outputText.text
        selfies.append(newSelfie!)
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Selfie", inManagedObjectContext: managedContext)
        let managedSelfie = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        managedSelfie.setValue(newSelfie!.mood, forKey: "mood")
        managedSelfie.setValue(newSelfie!.date, forKey: "date")
        managedSelfie.setValue(newSelfie!.color, forKey: "color")
        managedSelfie.setValue(newSelfie!.note, forKey: "note")
        managedSelfie.setValue(newSelfie!.photo, forKey: "photo")
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
   
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        inputText.resignFirstResponder()
        let temp = inputText.text
        outputText.text = temp
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selfieInfo.text = "Mood: \(newSelfie!.mood)\nDate: \(newSelfie!.date)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
