//
//  HomeTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/2/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol HomeTableViewData {
    func displayItem()
}

class HomeTableViewCell: UITableViewCell, HomeTableViewData {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contributorLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func displayItem() {
//        titleLabel.text = article.title
//        contributorLabel.text = article.writer
//        categoryLabel.text = article.category
//        featuredImage.image = UIImage(named: article.image)
    }
}
