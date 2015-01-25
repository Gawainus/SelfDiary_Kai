//
//  DisplayViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var curr : Selfie?
    
    @IBOutlet weak var currImage: UIImageView!
    
    @IBAction func showDetails(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currImage.image = curr?.photo
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("Seguing!")
        var info = segue.destinationViewController as InfoViewController
        info.curr = self.curr
        NSLog("Segued!")
    }

}
