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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var featuredHelperImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        featuredImage.layer.cornerRadius = 20
        
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 4
        profileImage.layer.cornerRadius = 25
        profileImage.layer.shadowOpacity = 0.2
        profileImage.layer.shadowRadius = 2
        profileImage.layer.shadowColor = UIColor.black.cgColor
        profileImage.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func displayItem(article: ArticleModel) {
        titleLabel.text = article.postTitle
        contributorLabel.text = article.name
        categoryLabel.text = article.categories
        dateLabel.text = article.publishedAt?.convertDateSystem()
        profileImage.image = UIImage().getAvatar(id: article.avatar!)
        featuredImage.image = UIImage().getPostBackground(id: article.background!)
        featuredHelperImage.image = UIImage().getPostBackground(id: article.background!)
    }
}
