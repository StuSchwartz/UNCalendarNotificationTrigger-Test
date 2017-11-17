//: Playground - noun: a place where people can play

/*
 Test to show how to setup a UNCalendarNotificationTrigger with different
 options to show triggering for daily, weekly, monthly and yearly
 
 Show the next trigger date to check correctness
 
 This also shows the incorrect result for Monthly in Xcode 9.x, but this works in 8.x
 */

import Foundation
import UserNotifications


// setup for display of the date/time
var dateFormat = DateFormatter()
dateFormat.timeStyle = .medium
dateFormat.dateStyle = .full


// save the date
let baseDate = Date()
print("Basedate - \(dateFormat.string(from: baseDate))\n")


// adjust from current date to try different senarios
var startDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
print("Startdate - \(dateFormat.string(from: startDate))\n")


// Trigger daily
var triggers: Set<Calendar.Component> = [.hour, .minute]
var dateComps = Calendar.current.dateComponents(triggers, from: startDate)
var trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger Daily - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger Daily - nil")
}


// Trigger weekly
triggers = [.hour, .minute, .weekday]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger Weekly - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger Weekly - nil\n")
}


// Trigger monthly
triggers = [.hour, .minute, .day]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger Monthly - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger Monthly - nil\n")
}


// Trigger yearly
triggers = [.hour, .minute, .month, .day]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger Yearly - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger Yearly - nil\n")
}


