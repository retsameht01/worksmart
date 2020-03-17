//
//  TableViewTest.swift
//  PicSay
//
//  Created by Tin Le on 2/27/20.
//  Copyright © 2020 fantasticsoft. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class EventsCalendarView: UITableViewController {
    
    var events: [EKEvent]?
    let eventStore = EKEventStore()
    var eventDates = [String]() 
    var sectionData = [String: [String]]()
    var sectionHeaders = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarToTheView()
        self.tableView = UITableView(frame: CGRect.zero, style: .grouped)
        self.tableView.estimatedSectionHeaderHeight = 40.0
        self.tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        addSampleEvents(eventName: "Sarah Lee @9:45")
        addSampleEvents(eventName: "Jamie Green @10:30")
        addSampleEvents(eventName: "Jennifer Smith @2:30")
        fetchEvents()
    }
    
    func setNavBarToTheView() {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 64.0))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "Appointments");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: nil);
        navItem.leftBarButtonItem = doneItem;
        navBar.setItems([navItem], animated: true);
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section] //getNiceDateString(dateStr: eventDates[section])
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundColor = .green

        // Do whatever with the header view... e.g.
        // headerView.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sectionListData = sectionData[sectionHeaders[section]] {
            return sectionListData.count
        }
        
        /*if let events = events {
            let section = eventDates[section]
            var count = 0
            for event in events {
                    if let date = event.occurrenceDate {
                        if (date.description == section) {
                            count = count + 1
                        }
                }
            }
            //print("There are \(count) for \(section)")
            return count
        }*/
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indexPath row: \(indexPath.row) section: \(indexPath.section)")
        let sectionList = sectionData[sectionHeaders[indexPath.section]]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        if let sectionList = sectionList {
            cell.textLabel!.text = sectionList[indexPath.row]
        } else {
            cell.textLabel!.text = "Default"
        }
        
         //events?[(indexPath as NSIndexPath).section].title.description //"\(indexPath.row)"
        return cell
    }
    
    //MARK:- Events EventKit related functions
    
    func addSampleEvents(eventName: String) {
        eventStore.requestAccess(to: .event) {(granted, error) in
            if !granted { return }
            let event = EKEvent(eventStore: self.eventStore)
            event.title = eventName
            event.startDate = Date() //today
            event.endDate = event.startDate.addingTimeInterval(240) //1 hour long meeting
            event.calendar = self.eventStore.defaultCalendarForNewEvents
            do {
                try self.eventStore.save(event, span: .thisEvent, commit: true)
                //self.savedEventId = event.eventIdentifier //save event id to access this particular event later
            } catch {
                // Display error to user
                print("save event errors")
            }
        }
    }
    
    func fetchEvents(){
      let now = Date()
      let calendar = Calendar.current
      var dateComponents = DateComponents.init()
      dateComponents.day = 90
      let futureDate = calendar.date(byAdding: dateComponents, to: now) // 1
      
      let eventsPredicate = self.eventStore.predicateForEvents(withStart: now, end: futureDate!, calendars: nil) // 2
      
        self.events = self.eventStore.events(matching: eventsPredicate)
      
      if let evnts = events {
            for event in evnts {
                print("\(event.title.description)")
                if let date = event.occurrenceDate {
                    let simpleDate = getNiceDateString(dateStr: date.description)
                    if var eventList = sectionData[simpleDate] {
                        eventList.append(event.description)
                        sectionData[simpleDate] = eventList
                    } else {
                        sectionData[simpleDate] = [event.title.description]
                        sectionHeaders.append(simpleDate)
                    }
                    eventDates.append(date.description)
                }
        }
      }
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        //tableView.reloadData()
        
    }
    
    func getNiceDateString(dateStr: String) ->String {
        let inputFormat = DateFormatter()
        inputFormat.dateFormat = "yyyy-MM-dd hh:mm:ss Z"
        let date = inputFormat.date(from: dateStr)
        
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "EEEE MMMM dd"
        
        if let date = date {
            return outputFormat.string(from: date)
        } else {
            return dateStr
        }
        //return outputFormat.string(for: date)
    }
}
