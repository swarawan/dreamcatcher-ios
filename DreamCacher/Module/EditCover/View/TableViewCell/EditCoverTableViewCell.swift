//
//  EditCoverTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/22/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class EditCoverTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayCover(cover: CoverModel){
        coverImage.image = cover.image
    }
}
