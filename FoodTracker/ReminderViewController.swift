//
//  ReminderViewController.swift
//  FoodTracker
//
//  Created by Logan on 2/20/16.
//  Copyright © 2016 Logan. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDate = NSDate()
        datePicker.minimumDate = currentDate

        }


    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //MARK: Utilities
    func convertDateToString(dateTime: UIDatePicker) -> String{
        let tempDate = dateTime.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE: MM-dd-YYYY hh:mm"
        let string = dateFormatter.stringFromDate(tempDate)
        return string
    }
    
    //Events
    @IBAction func btnAddTsk_Click(sender: UIButton){
        let tempDateTime = convertDateToString(datePicker)
        reminderManager.addReminder(nameField.text!, desc: descField.text!, dateTime: tempDateTime)
        self.view.endEditing(true)
        nameField.text = ""
        descField.text = ""
        datePicker.setDate(NSDate(), animated: true)
        navigationController?.popViewControllerAnimated(true)
    }

    

    

    
    

}

