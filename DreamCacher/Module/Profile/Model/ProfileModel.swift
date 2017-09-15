//
//  Profile.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/14/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileModel : Mappable{
    
    var success: Bool?
    var message: String?
    var userId: Int?
    var name: String?
    var address: String?
    var bio: String?
    var totalPost: Int?
    var avatarId: Int?
    var coverPhotoId: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.userId <- map["id_user"]
        self.name <- map["name"]
        self.address <- map["address"]
        self.bio <- map["bio"]
        self.totalPost <- map["total_posts"]
        self.avatarId <- map["id_avatar"]
        self.coverPhotoId <- map["id_cover_photo"]
    }
}
