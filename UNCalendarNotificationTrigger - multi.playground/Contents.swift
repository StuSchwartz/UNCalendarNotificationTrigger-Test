//: Playground - noun: a place where people can play

/*
 Test to show how to setup a UNCalendarNotificationTrigger with different
 options to show triggering for daily, weekly, monthly and yearly
 
 Show the next trigger date to check correctness
 
 This also shows the incorrect result for Monthly in Xcode 9.x, but this works in 8.x
 */


import Foundation
import UserNotifications


/*
 Test for multiple days, weeks, months, years
 
 I have not been able to get this to work, but when I do I will post the results
 */
let count = 2
print("Test for multi count triggers\n")

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


// Trigger every other Day
var triggers: Set<Calendar.Component> = [.hour, .minute]
var dateComps = Calendar.current.dateComponents(triggers, from: startDate)
dateComps.day = count
var trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger every other Day - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger every other Day - nil\n")
}


// Trigger every other week
triggers = [.hour, .minute, .weekday]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
//dateComps.week = count ???
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger every other week - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger every other week - nil\n")
}


// Trigger every other month
triggers = [.hour, .minute, .day]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
dateComps.month = count
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger every other month - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger every other month - nil\n")
}


// Trigger every other year
triggers = [.hour, .minute, .month, .day]
dateComps = Calendar.current.dateComponents(triggers, from: startDate)
dateComps.year = count
trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
if let nextDate = trigger.nextTriggerDate()
{
    print("Trigger every other year - \(dateFormat.string(from: nextDate))\n")
}
else
{
    print("Trigger every other year - nil\n")
}

