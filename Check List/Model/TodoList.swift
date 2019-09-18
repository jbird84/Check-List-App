//
//  TodoList.swift
//  Check List
//
//  Created by Kinney Kare on 9/17/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import Foundation

class TodoList {
    
    var toDos: [ChecklistItem] = []
    
    init() {
        
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a break"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk to dog"
        row4Item.text = "Say a prayer"
        
        toDos.append(row0Item)
        toDos.append(row1Item)
        toDos.append(row2Item)
        toDos.append(row3Item)
        toDos.append(row4Item)
        
    }
    
}