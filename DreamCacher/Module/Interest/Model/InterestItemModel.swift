//
//  InterestItemModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/9/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct InterestItemModel : Mappable {
    var backgroundId: String?
    var category: String?
    
    init() {
        
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        self.backgroundId <- map["id_background"]
        self.category <- map["categories"]
    }
}
