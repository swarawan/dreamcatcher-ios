//
//  DetailArticleModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

class DetailArticleModel : Mappable {
    var success: Bool?
    var message: String?
    var id: Int?
    var name: String?
    var postTitle: String?
    var avatar: Int?
    var background: Int?
    var categories: String?
    var content: String?
    var publishedAt : String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        
        self.id <- map["id_post"]
        self.name <- map["name"]
        self.postTitle <- map["post_title"]
        self.avatar <- map["id_avatar"]
        self.background <- map["id_background"]
        self.categories <- map["categories"]
        self.content <- map["content"]
        self.publishedAt <- map["published_at"]
    }
}

