//
//  BookmarkModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/18/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct BookmarkModel : Mappable {
    var success: Bool?
    var message: String?
    var bookmarks: [ArticleModel]?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.bookmarks <- map["bookmarks"]
    }
}

