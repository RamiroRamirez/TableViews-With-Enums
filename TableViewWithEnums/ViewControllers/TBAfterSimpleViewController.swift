//
//  TBAfterSimpleViewController.swift
//  TableViewWithEnums
//
//  Created by Ramiro Ramirez on 02/12/15.
//  Copyright © 2015 RAM. All rights reserved.
//

import UIKit

class TBAfterSimpleViewController   : UIViewController {

    // MARK : - Outlets
    
    @IBOutlet weak var messageLabel : UILabel?
    
    // MARK : - Variables
    
    var messageToShow               : String?
    
    // MARK : - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageLabel?.text = messageToShow
    }

}
