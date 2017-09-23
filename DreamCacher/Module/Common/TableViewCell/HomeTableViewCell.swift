//
//  HomeTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/2/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol HomeTableViewData {
    func displayItem(article: ArticleModel)
}

class HomeTableViewCell: UITableViewCell, HomeTableViewData {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contributorLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        featuredImage.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func displayItem(article: ArticleModel) {
        titleLabel.text = article.postTitle
        contributorLabel.text = article.name
        categoryLabel.text = article.categories
        dateLabel.text = article.updatedAt?.convertDateSystem()
        profileImage.image = UIImage().getAvatar(id: article.avatar!)
        featuredImage.image = UIImage().getPostBackground(id: article.background!)
    }
}
