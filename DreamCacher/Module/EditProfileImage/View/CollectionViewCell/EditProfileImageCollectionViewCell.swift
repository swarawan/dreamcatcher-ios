//
//  EditProfileImageCollectionViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/23/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class EditProfileImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayAvatar(avatar: EditProfileImageModel) {
        avatarImage.image = avatar.avatar
    }
}
