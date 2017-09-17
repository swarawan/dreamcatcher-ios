//
//  InterestCache.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/11/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation
import SwiftyJSON

var Interest : InterestCache {
    struct Singleton {
        static let instance = InterestCache()
    }
    return Singleton.instance
}

class InterestCache {
    var interests: String = ""
    
    init() {
        self.interests = getInterests()
    }
    
    func getInterests() -> String {
        if let interests = UserDefaults.standard.string(forKey: "interests") {
            return interests
        }
        return ""
    }
    
    /* stored with format: "interestA,interestB,interestC" as String */
    func saveInterests(interests: String) {
        UserDefaults.standard.set(interests, forKey: "interests")
    }
}
