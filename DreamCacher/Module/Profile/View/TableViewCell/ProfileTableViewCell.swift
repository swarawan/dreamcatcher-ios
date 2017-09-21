//
//  ProfileTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/20/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        featuredImage.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayArticle(article: ArticleModel) {
        featuredImage.image = UIImage().getPostBackground(id: article.background!)
        titleLabel.text = article.postTitle
    }
    
}
