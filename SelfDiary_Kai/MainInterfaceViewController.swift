//
//  MainInterfaceViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit
import CoreData

let nirvana = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
let sad = UIColor(red: 100/255, green: 100/255, blue: 0.7, alpha: 1)
let happy = UIColor(red: 200/255, green: 1.0, blue: 150/255, alpha: 0.9)
let blissful = UIColor(red: 153/255, green: 240/255, blue: 1, alpha: 0.9)
let mad = UIColor(red: 1.0, green: 51/255, blue: 52/255, alpha: 0.9)
let annoyed = UIColor(red: 229/225, green: 1.0, blue: 204/255, alpha: 0.9)

var moods = ["Nirvana", "Sad", "Happy", "Blissful", "Mad", "Annoyed"]
var moodsDict = ["Nirvana":nirvana, "Sad":sad, "Happy":happy, "Blissful":blissful, "Mad":mad, "Annoyed":annoyed]

var selfies = [Selfie]()
var selfiesManaged = [NSManagedObject]()

class MainInterfaceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //future list ["Weird", "Bewildered", "Cynical", "Optimistic"]
    var newSelfie : Selfie?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var moodPicker: UIPickerView!
    
    @IBAction func createSelfie(sender: AnyObject) {
        let currMood = moods[moodPicker.selectedRowInComponent(0)]
        newSelfie = Selfie.init( mood:currMood, date:datePicker.date, color: moodsDict[currMood]! )
        
    }
    
    // Mark PickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moods.count
    }
    
    // Mark PickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return moods[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // get the background color
        var backGC : UIColor
        backGC = moodsDict[moods[row]]!
        
        // get the foreground color
        var backGCRed:CGFloat = 0
        var backGCGreen:CGFloat = 0
        var backGCBlue:CGFloat = 0
        var backGCAlpha:CGFloat = 0
        
        backGC.getRed( &backGCRed, green: &backGCGreen, blue: &backGCBlue, alpha: &backGCAlpha)
        
        var pickerBGC = UIColor(red: 1-backGCRed, green: 1-backGCGreen, blue: 1-backGCBlue, alpha: 0.05)
        
        //paint
        self.view.backgroundColor = backGC
        moodPicker.backgroundColor = pickerBGC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = moodsDict[moods[0]]!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        var cameraView = segue.destinationViewController as CameraViewController
        
        // Pass the selected object to the new view controller.
        cameraView.newSelfie = self.newSelfie
    }

}
