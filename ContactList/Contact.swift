//
//  File.swift
//  ContactList
//
//  Created by IR Supera on 2022-04-20.
//

import Foundation

class Contact: NSObject, NSCoding{

    var name: String
    var mobile: String
    var email: String
    
    init(name: String, mobile: String, email: String){
        self.name = name
        self.mobile = mobile
        self.email = email
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        mobile = coder.decodeObject(forKey: "mobile") as! String
        email = coder.decodeObject(forKey: "email") as! String
        super.init()
    }

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(mobile, forKey: "mobile")
        coder.encode(email, forKey: "email")
    }
    
}
