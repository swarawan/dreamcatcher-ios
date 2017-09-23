//
//  InterestService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/9/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import Moya


class InterestService {
    
    func loadInterest(completionHandler: @escaping (InterestModel) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true), AuthPlugin()])
        provider.request(.getInterests()) { (result) -> Void in
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let interestModel = Mapper<InterestModel>().map(JSONString: json)
                
                completionHandler(interestModel!)
                
            case let .failure(error):
                
                var interestModel = InterestModel()
                interestModel.message = error.errorDescription
                
                completionHandler(interestModel)
            }
        }
    }
}
