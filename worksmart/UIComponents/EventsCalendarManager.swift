//
//  EventsCalendarManager.swift
//  worksmart
//
//  Created by Tin Le on 2/22/20.
//  Copyright © 2020 Tin Le. All rights reserved.
//

import UIKit
import EventKit
import EventKitUI

class EventsCalendarManager: NSObject {
    
    var eventStore: EKEventStore!
    var calendar: EKCalendar!
    
    override init() {
        eventStore = EKEventStore()
    }
    
    // Request access to the Calendar
    
    private func requestAccess(completion: @escaping EKEventStoreRequestAccessCompletionHandler) {
        eventStore.requestAccess(to: EKEntityType.event) { (accessGranted, error) in
            completion(accessGranted, error)
        }
    }
    
    // Get Calendar auth status
    
    private func getAuthorizationStatus() -> EKAuthorizationStatus {
        return EKEventStore.authorizationStatus(for: EKEntityType.event)
    }
    
    func addEventButtonTapped(_ sender: UIBarButtonItem) {
       // Create an Event Store instance
       let eventStore = EKEventStore();
       
       // Use Event Store to create a new calendar instance
       if let calendarForEvent = eventStore.calendar(withIdentifier: self.calendar.calendarIdentifier)
       {
           let newEvent = EKEvent(eventStore: eventStore)
           
           newEvent.calendar = calendarForEvent
           newEvent.title = "some event"
           newEvent.startDate = Date()
           newEvent.endDate = Date()
           
           // Save the event using the Event Store instance
           do {
               try eventStore.save(newEvent, span: .thisEvent, commit: true)
           } catch {
               let alert = UIAlertController(title: "Event could not save", message: (error as NSError).localizedDescription, preferredStyle: .alert)
               let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alert.addAction(OKAction)
               
               
           }
       }
    }
}

// EKEventEditViewDelegate

extension EventsCalendarManager: EKEventEditViewDelegate {
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
}
