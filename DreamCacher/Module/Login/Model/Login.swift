//
//  LoginModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import ObjectMapper

struct Login : Mappable {
    var success: Bool?
    var message: String?
    var token: String?
    
    init() {
    }
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.success <- map["success"]
        self.message <- map["message"]
        self.token <- map["token"]
    }
}
