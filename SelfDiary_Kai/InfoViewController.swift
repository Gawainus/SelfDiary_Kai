//
//  InfoViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    var curr : Selfie?
    
    @IBOutlet weak var currImage: UIImageView!
    @IBOutlet weak var moodImage: UIImageView!
    @IBOutlet weak var mood: UILabel!
    @IBOutlet weak var note: UILabel!

   
    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        currImage.image = curr?.photo
        moodImage.backgroundColor = moodsDict[curr!.mood]
        mood.text = curr?.mood
        note.text = curr?.note
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
