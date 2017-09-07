//
//  HomeModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct HomeModel : Mappable {
    var id: Int?
    var postTitle: String?
    var idBackground: Int?
    var categories: String?
    var content: String?
    var publishedAt : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        postTitle <- map["post_title"]
        idBackground <- map["id_background"]
        categories <- map["categories"]
        content <- map["content"]
        publishedAt <- map["published_at"]
    }
}
