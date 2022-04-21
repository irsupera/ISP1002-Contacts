//
//  File.swift
//  ContactList
//
//  Created by IR Supera on 2022-04-20.
//  Iricher Supera - A00237146

import Foundation

class Contact: NSObject, NSCoding{

    // attributes
    var name: String
    var mobile: String
    var email: String
    
    // initialization
    init(name: String, mobile: String, email: String){
        self.name = name
        self.mobile = mobile
        self.email = email
    }
    
    required init?(coder: NSCoder) {
        // decoding object
        name = coder.decodeObject(forKey: "name") as! String
        mobile = coder.decodeObject(forKey: "mobile") as! String
        email = coder.decodeObject(forKey: "email") as! String
        super.init()
    }

    func encode(with coder: NSCoder) {
        // encoding object
        coder.encode(name, forKey: "name")
        coder.encode(mobile, forKey: "mobile")
        coder.encode(email, forKey: "email")
    }
    
}
