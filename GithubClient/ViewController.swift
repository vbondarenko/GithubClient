//
//  ViewController.swift
//  GithubClient
//
//  Created by vladimir on 5/14/16.
//  Copyright © 2016 vb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let perPage = 100
    let since = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [Users]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GitHub Users"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 119
        tableView.rowHeight = UITableViewAutomaticDimension

        fetchUsers(since, perPage: perPage)
    }
    
    func fetchUsers(since: Int, perPage: Int) {

        apiService.fetchUsers(since, perPage: perPage) { (array) in
            self.users.appendContentsOf(array)
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(UserTableViewCell.identifier) as! UserTableViewCell
        
        var user : Users!
        user = users[indexPath.row]
        cell.user = user
        
        return cell
    }

}

