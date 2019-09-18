//
//  ViewController.swift
//  Check List
//
//  Created by Kinney Kare on 9/17/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var toDoList: TodoList
    @IBOutlet weak var cellTextField: UITextField!
    
    
    required init?(coder aDecoder: NSCoder) {
        toDoList = TodoList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true // sets large title for Nav bar
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = toDoList.toDos[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = toDoList.toDos[indexPath.row]
            configureCheckmark(for: cell, with: item)
              
        //when you select a row, it will stay selected unless you tell it otherwise. This line below states to deselect the row... 
        tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //this activates the slide to delete in the table view
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        toDoList.toDos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
        
        let newRowIndex = toDoList.toDos.count
        _ = toDoList.newTodo()
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
    
    //this method sets the correct text for the correct cell.
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = item.text
        }
    }
    
    //this method allow you to "tap" and a checkmark will appear. Tap again and checkmark will disappear
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
          cell.accessoryType = .none
        } else {
          cell.accessoryType = .checkmark
         }
    item.toggleChecked()
    }
}

