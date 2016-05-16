//
//  APIService.swift
//  GithubClient
//
//  Created by vladimir on 5/14/16.
//  Copyright © 2016 vb. All rights reserved.
//

import UIKit
import Alamofire

class APIService: NSObject {
    
    func fetchUsers(since: Int, perPage: Int, completion:(([Users]) -> Void)) {
        
        Alamofire.request(.GET, "https://api.github.com/users?since=\(since)&per_page=\(perPage)") .responseJSON{ response in
            
            //print(response.request)  // URL request
            //print(response.response) // URL response
            //print(response.data)     // Server Data
            //print(response.result)   // Result of Response
        
            var users = [Users]()
            
                if let JSON = response.result.value{
                    if let array = JSON as? [AnyObject] {
                        for dict in array {
                            let user = Users.create(fromDictionary: dict as! [String : AnyObject])
                            users.append(user)
                        }
                    }
                }
                completion(users)
            }
        }
}
