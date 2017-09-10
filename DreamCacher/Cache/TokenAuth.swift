//
//  Token.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/8/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation

var Token : TokenAuth {
    struct Singleton {
        static let instance = TokenAuth()
    }
    return Singleton.instance
}

class TokenAuth {
    var accessToken: String = ""
    
    init() {
        self.accessToken = getAccessToken()
    }
    
    func getAccessToken() -> String {
        if let access_token = UserDefaults.standard.string(forKey: "access_token") {
           return access_token
        }
        return ""
    }
    
    func saveAccessToken(accessToken: String) {
        self.accessToken = accessToken
        
        UserDefaults.standard.set(accessToken, forKey: "access_token")
    }
}
