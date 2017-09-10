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
    var success: Bool?
    var message: String?
    var posts: [ArticleModel]?
    
    init() {

    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.posts <- map["posts"]
    }
}
