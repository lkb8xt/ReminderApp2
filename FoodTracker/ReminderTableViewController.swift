//
//  ReminderTableViewController.swift
//  FoodTracker
//
//  Created by Logan on 2/21/16.
//  Copyright © 2016 Logan. All rights reserved.
//

import UIKit

class ReminderTableViewController: UITableViewController {
    
    //MARK: Properties
    
    @IBOutlet var tableReminders: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelectionDuringEditing = false;

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return reminderManager.reminders.count
    }
    
    override func viewWillAppear(animated: Bool) {
        tableReminders.reloadData()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "default")
        
        cell.textLabel!.text = reminderManager.reminders[indexPath.row].name
        cell.detailTextLabel!.text = reminderManager.reminders[indexPath.row].dateTime
        return cell
    }
    
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            reminderManager.reminders.removeAtIndex(indexPath.row)
            tableReminders.reloadData()
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } /*else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }   */ 
    }
    
    //Events
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath){
        print("Here is didselectrowatindexpath..\(indexPath.row)")
        
        performSegueWithIdentifier("EditViewSegue", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "EditViewSegue"{
            print("preparing for edit segue")
            if let destinationVC = segue.destinationViewController as? EditViewController{
                if let senderInt = sender as? Int{
                    destinationVC.index = senderInt
                    reminderManager.currentlyEditing = senderInt
                    print("sender Int = \(senderInt)")
                }
                
            }
            
            

        }
    }



    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

class EditViewController: UIViewController {
    
    var index: Int?
    
    //MARK: Properties
    @IBOutlet weak var reminderName: UILabel!
    
    @IBOutlet weak var longDesc: UITextView!
    
    @IBOutlet weak var dateTime: UILabel!
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let row = reminderManager.reminders[index!]
        reminderName.text = row.name
        longDesc.text = row.desc
        dateTime.text = row.dateTime
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   @IBAction func onClickEdit(sender: UIBarButtonItem) {
    performSegueWithIdentifier("finalEditSegue", sender: nil)
    }
//    
//    
//    
//    
//    // MARK: - Navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "finalEditSegue"{
//            print("preparing for final!!!!! edit segue")
//            if let destinationVC = segue.destinationViewController as? FinalEditViewController{
//                if let senderInt = sender as? Int{
//                    print("HERE IN SEETING INDEX")
//                    destinationVC.finalIndex = senderInt
//                    print("sender Int = \(senderInt)")
//                }
//            }
//    
//        }
//    }
    /*
    
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

class FinalEditViewController: UIViewController {
    var finalIndex: Int?
    
    //MARK: Properties
    @IBOutlet weak var editName: UITextField!
    
    @IBOutlet weak var editLong: UITextField!
    
    @IBOutlet weak var editDateTime: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
//        if let indexCheck = finalIndex as? Int{
        let row = reminderManager.reminders[reminderManager.currentlyEditing]
            
//        }
        editName.text = row.name
        editLong.text = row.desc
        let currentDate = NSDate()
        editDateTime.minimumDate = currentDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE: MM-dd-YYYY hh:mm"
//        var reminderDate = dateFormatter.dateFromString(row.dateTime)
//        editDateTime.date = reminderDate!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
