//
//  ReminderManager.swift
//
//
//  Created by Logan on 2/21/16.
//  Copyright © 2016 Logan. All rights reserved.
//

import UIKit

var reminderManager: ReminderManager = ReminderManager()

struct reminder{
    var name: String
    var desc: String?
    var dateTime: String
}

class ReminderManager: NSObject {
    
    var reminders = [reminder]()
    var currentlyEditing = 0
    
    func addReminder(name: String, desc: String?, dateTime: String){
        reminders.append(reminder(name: name, desc: desc, dateTime: dateTime))
    }

}


