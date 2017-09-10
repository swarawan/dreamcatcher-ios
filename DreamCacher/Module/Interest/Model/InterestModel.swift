//
//  InterestModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/9/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct InterestModel : Mappable {
    var success: Bool?
    var message: String?
    var interests: [InterestItemModel]?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.interests <- map["categories"]
    }
}
