//
//  UserTableViewCell.swift
//  GithubClient
//
//  Created by vladimir on 5/14/16.
//  Copyright © 2016 vb. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"

    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var url: UITextView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var user : Users! {
        didSet {
            if let urlString = user.avatar, url = NSURL(string: urlString) {
                self.activityIndicator.startAnimating()
                self.activityIndicator.hidden = false
                avatar.sd_setImageWithURL(url, completed: { (image, error, cacheType, url) in
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                })
            }

            login.text = user.login
            url.text = user.url
        }
    }

}
