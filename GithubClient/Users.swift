//
//  Users.swift
//  GithubClient
//
//  Created by vladimir on 5/14/16.
//  Copyright © 2016 vb. All rights reserved.
//

import UIKit

class Users: NSObject {
    var id : String!
    var login : String!
    var url : String!
    var avatar : String!
    
    class func create(fromDictionary dict: [String : AnyObject]) -> Users {
        
        let object = Users()
        
        object.id = dict["id"] as? String
        object.login = dict["login"] as? String
        object.url = dict["html_url"] as? String
        object.avatar = dict["avatar_url"] as? String
        
        return object
    }
}
