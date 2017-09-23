//
//  EditProfileImagePresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/23/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol EditProfileImageProtocol : NSObjectProtocol {
    func displayAvatars(avatars: [EditProfileImageModel])
}

class EditProfileImagePresenter {
    weak private var delegate: EditProfileImageProtocol?
    
    func attachView(delegate: EditProfileImageProtocol) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadAvatar() {
        let avatars = [
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-1")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-2")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-8")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-4")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-5")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-6")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-7")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-8")),
            EditProfileImageModel(avatar: #imageLiteral(resourceName: "avatar-9"))
        ]
        self.delegate?.displayAvatars(avatars: avatars)
    }
}
