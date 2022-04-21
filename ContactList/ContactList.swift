//
//  File.swift
//  ContactList
//
//  Created by IR Supera on 2022-04-20.
//  Iricher Supera - A00237146

import Foundation

class ContactList{
    
    var contacts = [Contact]()
    
    // create URL and append file name for archiving
    var contactURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("contact.archive")
    }()
    
    init(){
        do{
            // retrieve data from the filesystem
            let data = try Data(contentsOf: contactURL)
            contacts = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Contact]
        }catch let err{
            print(err)
        }
    }
    
    func addContact(contact: Contact){
        // add contact to list
        contacts.append(contact)
    }
    
    func deleteContact(row: Int){
        // remove contact from list
        contacts.remove(at: row)
    }
    
    func editContact(row: Int, contact: Contact) {
        // update contact by removing and adding new one
        contacts.remove(at: row)
        contacts.insert(contact, at: row)
    }
    
    func moveItem(from: Int, to: Int){
        // move contact by removing and adding new one
        let newRow = contacts[from]
        contacts.remove(at: from)
        contacts.insert(newRow, at: to)
    }
    
    func save(){
        do{
            // save data to the filesystem
            let data = try NSKeyedArchiver.archivedData(withRootObject: contacts, requiringSecureCoding: false)
            try data.write(to: contactURL)
        }catch let err{
            print(err)
        }
        
    }
}
