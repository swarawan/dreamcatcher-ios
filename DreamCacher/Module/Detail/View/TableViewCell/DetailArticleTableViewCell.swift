//
//  DetailArticleTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/7/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class DetailArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contributorLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        featuredImage.layer.cornerRadius = 40
        
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 5
        profileImage.layer.cornerRadius = 30
        profileImage.layer.shadowOpacity = 0.2
        profileImage.layer.shadowRadius = 2
        profileImage.layer.shadowColor = UIColor.black.cgColor
        profileImage.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayItem(article: ArticleModel) {
        titleLabel.text = article.postTitle
        contributorLabel.text = article.name
        categoryLabel.text = article.categories
        dateLabel.text = article.publishedAt?.convertDateSystem()
        profileImage.image = UIImage().getAvatar(id: article.avatar!)
        featuredImage.image = UIImage().getPostBackground(id: article.background!)
        contentLabel.text = article.content
    }
}
