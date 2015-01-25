//
//  SelfiesTableTableViewController.swift
//  SelfDiary_Kai
//
//  Created by Gawain Tsao on 1/18/15.
//  Copyright (c) 2015 Gawain Tsao. All rights reserved.
//

import UIKit

class SelfiesTableTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newSelfie = Selfie(mood: "Sad", date: NSDate.init(), color: moodsDict["Sad"]!, note: "I am Ito Yuna")
        newSelfie.photo = UIImage(named: "ito")
        selfies.append(newSelfie)
        
        newSelfie = Selfie(mood: "Blissful", date: NSDate.init(timeIntervalSinceNow: 60 * 60 * 24 * 3), color: moodsDict["Blissful"]!, note: "I am Monica Bellucci")
        newSelfie.photo = UIImage(named: "monica")
        selfies.append(newSelfie)
        
        view.reloadInputViews()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return selfies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("selfieCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = String.init( "\(selfies[indexPath.row].date)" )
        //cell.detailTextLabel?.text = String.init( "\(selfies[indexPath.row].descrip)" )

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var displaySelfie = segue.destinationViewController as DisplayViewController
        
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let selectedSelfie = selfies[indexPath.row]
            displaySelfie.curr = selectedSelfie
        }
        
    }

}
