//
//  ArticleModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/7/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct ArticleModel : Mappable {
    var id: Int?
    var name: String?
    var postTitle: String?
    var idBackground: Int?
    var categories: String?
    var content: String?
    var publishedAt : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.postTitle <- map["post_title"]
        self.idBackground <- map["id_background"]
        self.categories <- map["categories"]
        self.content <- map["content"]
        self.publishedAt <- map["published_at"]
    }
}
