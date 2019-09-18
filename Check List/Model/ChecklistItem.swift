//
//  ChecklistItem.swift
//  Check List
//
//  Created by Kinney Kare on 9/17/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    var text = ""
    var checked = true
    
    func toggleChecked() {
        checked = !checked
    }
    
}
