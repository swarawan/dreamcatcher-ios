//
//  EditProfileImageViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/23/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension EditProfileImageViewController : EditProfileImageProtocol {
    func displayAvatars(avatars: [EditProfileImageModel]) {
        self.avatars = avatars
        self.avatarCollectionView.reloadData()
    }
}
