//
//  ViewController.swift
//  ContactList
//
//  Created by IR Supera on 2022-04-19.
//  Iricher Supera - A00237146

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var contactList: ContactList!
    var contacts: Contact!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set values for fields based from index/selected row
        if index != nil {
            nameField.text = contactList.contacts[index].name
            mobileField.text = contactList.contacts[index].mobile
            emailField.text = contactList.contacts[index].email
        }
        // Set label to blank
        errorLabel.text = ""
    }

    @IBAction func save(_ sender: Any) {
        // Show error when name field is empty
        if nameField.text!.isEmpty{
            errorLabel.alpha = 1
            errorLabel.text = NSLocalizedString("Enter complete name", comment: "the name is required")
        // Show error when mobile field is empty
        }else if mobileField.text!.isEmpty{
            errorLabel.alpha = 1
            errorLabel.text = NSLocalizedString("Enter mobile number", comment: "the mobile number is required")
        }else{
            // Prepare item and save in the list
            let name = nameField.text!
            let mobile = mobileField.text!
            let email = emailField.text!
            let contact = Contact(name: name, mobile: mobile, email: email)
            if index == nil{
                // add new item
                contactList.addContact(contact: contact)
            } else {
                // edit existing item
                contactList.editContact(row: index, contact: contact)
            }
            navigationController?.popViewController(animated: true)
        }
        // Animate error to alpha 0/transparent
        UIView.animate(withDuration: 2){
            () -> Void in
            self.errorLabel.alpha = 0
        }
    }
    
}

