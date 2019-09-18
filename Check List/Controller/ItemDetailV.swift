//
//  AddItemTableViewController.swift
//  Check List
//
//  Created by Kinney Kare on 9/18/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

//Any ViewController that wants to get a new checklist back, needs to implement this protocol.
//NOTE: when using a protocol you need to be a delegate of THIS class.
protocol ItemDetailViewController: class {
    func addItemViewControllerDidCancel(_ controller: ItemDetailV)
    func addItemViewController(_ controller: ItemDetailV, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: ItemDetailV, didFinishEditing item: ChecklistItem)
}

class ItemDetailV: UITableViewController {

    //delegate property for the protocol
    weak var delegate: ItemDetailViewController?
    weak var todoList: TodoList?
    weak var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    
    //Bar-Button that cancles "adding a new item to list" and sends user back to the ChecklistViewController
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.addItemViewController(self, didFinishAdding: item)
            
        } else {
          if let item = todoList?.newTodo() {
            if let textFieldText = textField.text {
              item.text = textFieldText
            }
             item.checked = false
             delegate?.addItemViewController(self, didFinishAdding: item)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            addBarButton.isEnabled = true
        }
        navigationItem.largeTitleDisplayMode = .never
        
    }

    //this prevents the user from selecting the cell instead of the textfield giving a better user experience.
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    //viewWillAppear runs as soon as view appears. setting textField as first responder forces the keybord to come up as soon as user gets to this ADD screen. 
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
}

extension ItemDetailV: UITextFieldDelegate {
    
    //this method happens when the return button is pressed. 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //when a user taps ANY key on keyboard this method is called.
    //we are going to hide the ADD button unless text is shown in textField.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
            let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
    
}
