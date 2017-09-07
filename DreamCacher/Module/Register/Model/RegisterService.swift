//
//  RegisterService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import ObjectMapper

class RegisterService {
    
    // mocked login logic
    func register(param: RegisterParam, completionHandler: @escaping (Bool, Register) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.register(request: param)) { (result) -> Void in
            
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let register = Mapper<Register>().map(JSONString: json)
                
                completionHandler(true, register!)
                
            case let .failure(error):
                
                var register = Register()
                register.message = error.errorDescription
                
                completionHandler(false, register)
            }
        }
    }
}
