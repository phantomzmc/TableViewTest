//
//  Person.swift
//  TableViewTest
//
//  Created by Thannathrn Yuwasin on 7/15/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class Person: NSObject {
    var firstname:String!
    var lastname:String!
    var age:Int!
    var detail:String?
    var photoUrl:String?
    
    init(firstname:String,lastname:String,age:Int,photoUrl:String?) {
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
        self.photoUrl = photoUrl
        
    }
    init (json:NSDictionary?) {
        self.firstname = json?.object(forKey: "firstname") as! String
        self.lastname = json?.object(forKey: "lastname") as! String
        self.age = json?.object(forKey: "age") as! Int
        self.detail = json?.object(forKey: "detail") as? String
        self.photoUrl = json?.object(forKey: "photoUrl") as? String
    }
    
    override init() {
        self.firstname = ""
        self.lastname = ""
        self.age = 0
    }
    
    

}
