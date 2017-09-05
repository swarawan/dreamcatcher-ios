//
//  LoginService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class LoginService {
    
    // mocked login logic
    func login(param: LoginParam, callback: (LoginModel) -> Void) {
        var response: LoginModel
        
        if(param.email != "swarawan.rio@gmail.com") {
            response = LoginModel(success: false, message: "Email not found!")
        } else if(param.password != "123456") {
            response = LoginModel(success: false, message: "Password didn't match!")
        } else {
            response = LoginModel(success: true, message: "Welcome Rio~")
        }
        callback(response)
    }
}
