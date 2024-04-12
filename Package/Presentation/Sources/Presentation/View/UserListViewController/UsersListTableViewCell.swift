//
//  UsersListTableViewCell.swift
//  
//
//  Created by Leonardo Mendez on 11/04/24.
//

import UIKit
import Domain

class UsersListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        websiteLabel.text = "Website: \(user.website)"
        backgroundCellView.layer.cornerRadius = 16
    }
    
}
