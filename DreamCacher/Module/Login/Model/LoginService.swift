//
//  LoginService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import ObjectMapper

class LoginService {
    
    // mocked login logic
    func login(param: LoginParam, completionHandler: @escaping (Bool, Login) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.login(request: param)) { (result) -> Void in
            
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let login = Mapper<Login>().map(JSONString: json)
                
                completionHandler(true, login!)
                
            case let .failure(error):
                
                var login = Login()
                login.message = error.errorDescription
                
                completionHandler(false, login)
            }
        }
    }
}
