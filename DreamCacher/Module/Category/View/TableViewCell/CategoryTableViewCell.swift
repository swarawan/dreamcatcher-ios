//
//  CategoryTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/12/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayCategory(interest: InterestItemModel) {
        if interest.backgroundId == 1 {
            categoryImage.image = #imageLiteral(resourceName: "Courses")
        } else if interest.backgroundId == 2 {
            categoryImage.image = #imageLiteral(resourceName: "Opportunities")
        } else if interest.backgroundId == 3 {
            categoryImage.image = #imageLiteral(resourceName: "Facilities")
        } else if interest.backgroundId == 4 {
            categoryImage.image = #imageLiteral(resourceName: "Finances")
        } else if interest.backgroundId == 5 {
            categoryImage.image = #imageLiteral(resourceName: "Skills")
        }
    }
}
