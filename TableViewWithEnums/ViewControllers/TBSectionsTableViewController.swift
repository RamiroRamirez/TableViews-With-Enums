//
//  TBSectionsTableViewController.swift
//  TableViewWithEnums
//
//  Created by Ramiro Ramirez on 02/12/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

// Enum for sections in table view

enum TBSectionType: Int {
    
    case FirstSection = 0
    case SecondSection
    case ThirdSection
    case FourthSection
    
    static func allValues() -> [TBSectionType] {
        return [.FirstSection, .SecondSection, .ThirdSection, .FourthSection]
    }
    
    func title() -> String? {
        switch self {
        case .FirstSection      : return "First Section"
        case .SecondSection     : return "Second Section"
        case .ThirdSection      : return "Third Section"
        case .FourthSection     : return "Fourth Section"
        }
    }
    
    func numberOfRowsForSection() -> Int {
        switch self {
        case .FirstSection      : return TBRowsFirstSection.allValues().count
        case .SecondSection     : return TBRowsSecondSection.allValues().count
        case .ThirdSection      : return TBRowsThirdSection.allValues().count
        case .FourthSection     : return TBRowsFourthSection.allValues().count
        }
    }
    
    func titleForRow(row: Int) -> String? {
        switch self {
        case .FirstSection      : return TBRowsFirstSection(rawValue: row)?.title()
        case .SecondSection     : return TBRowsSecondSection(rawValue: row)?.title()
        case .ThirdSection      : return TBRowsThirdSection(rawValue: row)?.title()
        case .FourthSection     : return TBRowsFourthSection(rawValue: row)?.title()
        }
    }
}

// Enums for rows in each section

enum TBRowsFirstSection: Int {
    
    case Home = 0
    case Profile
    
    static func allValues() -> [TBRowsFirstSection] {
        return [.Home, .Profile]
    }
    
    func title() -> String? {
        switch self {
        case .Home              : return "Home"
        case .Profile           : return "Profile"
        }
    }
}

enum TBRowsSecondSection: Int {
    
    case Photos = 0
    case Videos
    
    static func allValues() -> [TBRowsSecondSection] {
        return [.Photos, .Videos]
    }
    
    func title() -> String? {
        switch self {
        case .Photos            : return "Home"
        case .Videos            : return "Videos"
        }
    }
}

enum TBRowsThirdSection: Int {
    
    case Photos = 0
    case Videos
    
    static func allValues() -> [TBRowsThirdSection] {
        return [.Photos, .Videos]
    }
    
    func title() -> String? {
        switch self {
        case .Photos            : return "Home"
        case .Videos            : return "Videos"
        }
    }
}

enum TBRowsFourthSection: Int {
    
    case Contact = 0
    case Imprint
    
    static func allValues() -> [TBRowsFourthSection] {
        return [.Contact, .Imprint]
    }
    
    func title() -> String? {
        switch self {
        case .Contact           : return "Contact"
        case .Imprint           : return "Imprint"
        }
    }
}


class TBSectionsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fdsafdasfda")
    }

}

extension TBSectionsTableViewController {
    
    // MARK : - Implementation UITableViewDataSource Protocol
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (TBSectionType(rawValue: section)?.numberOfRowsForSection() ?? 0)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "sectionCell_id")
        cell.textLabel?.text = TBSectionType(rawValue: indexPath.section)?.titleForRow(indexPath.row)
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return TBSectionType.allValues().count
    }
    
    // MARK : - Implementation UITableViewDelegate Protocol
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return TBSectionType(rawValue: section)?.title()
    }
    
}
