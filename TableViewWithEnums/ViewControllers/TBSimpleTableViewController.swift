//
//  TBSimpleTableViewController.swift
//  TableViewWithEnums
//
//  Created by Ramiro Ramirez on 02/12/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

// Let's say we need a tableView to show a menu with simple cells (editing just labels from standard tableviewcell)
// To do so, we need a enum with the different options to show:

// Enum to fill the table view 

enum TBMenuRow: Int {
    
    case Home = 0
    case Profile
    case Photos
    case Videos
    case Settings
    case Imprint
    
    // Static method to return an array with all the options for the menu (this will be used as datasource)
    
    static func allValues() -> [TBMenuRow] {
		return [.Home, .Profile, .Photos, .Videos, .Settings, .Imprint]
    }
    
    // Method to get the title for each menuRow
    
    func title() -> String? {
        switch self {
        case .Home:     return "Home"
        case .Profile:  return "Profile"
        case .Photos:   return "Photos"
        case .Videos:   return "Videos"
        case .Settings: return "Settings"
        case .Imprint:  return "Imprint"
        }
    }
    
    // Method to get the subtitle for each row
    
    func subtitle() -> String? {
        switch self {
        case .Home:     return "Go to Home"
        case .Profile:  return "Go to Profile"
        case .Photos:   return nil
        case .Videos:   return "Go to Videos"
        case .Settings: return "Go to Settings"
        case .Imprint:  return nil
        }
    }
    
    // Method to get the height of each row
    
    func heightForRow() -> CGFloat {
        switch self {
        case .Home:     return 80
        case .Profile:  return 55
        case .Photos:   return 40
        case .Videos:   return 50
        case .Settings: return 48
        case .Imprint:  return 49
        }
    }
    
    // Method to get the height of each row
    
    func prepareSegueForRow() -> String? {
        switch self {
        case .Home:     return "toHome"
        case .Profile:  return "toProfile"
        case .Photos:   return "toPhotos"
        case .Videos:   return "toVideos"
        case .Settings: return "toSettings"
        case .Imprint:  return "toImprint"
        }
    }
    
    // Text to be sent as sender in segue
    
    func textToSend() -> String? {
        switch self {
        case .Home:     return "String to display in Home"
        case .Profile:  return "String to display in Profile"
        case .Photos:   return "String to display in Photos"
        case .Videos:   return "String to display in Videos"
        case .Settings: return "String to display in Settings"
        case .Imprint:  return nil
        }
    }
}



class TBSimpleTableView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as? TBAfterSimpleViewController
        vc?.messageToShow = sender as? String
    }
}

// Extension to implement all the tableView methods

extension TBSimpleTableView {
    
    // MARK: - Implementation UITableViewDataSource Protocol
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TBMenuRow.allValues().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let menuRow = TBMenuRow.allValues()[indexPath.row]
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "simpleCell_id")
        cell.textLabel?.text = menuRow.title()
        cell.detailTextLabel?.text = menuRow.subtitle()
        return cell
    }
    
    // MARK: - Implementation UITableViewDelegate Protocol
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let menuRow = TBMenuRow.allValues()[indexPath.row]
        return menuRow.heightForRow()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let menuRow = TBMenuRow.allValues()[indexPath.row]
        if let segue = menuRow.prepareSegueForRow() {
            self.performSegueWithIdentifier(segue, sender: menuRow.textToSend())
        }
    }
}

