//
//  AddItemTableViewController.swift
//  Check List
//
//  Created by Kinney Kare on 9/18/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textField.delegate = self
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

extension AddItemTableViewController: UITextFieldDelegate {
    
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
