//
//  CategoryDetailService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/13/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import Moya

class CategoryDetailService {
    
    func getAllArticleByCategory(param: CategoryDetailParam, completionHandler: @escaping (HomeModel) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getArticlesByCategory(request: param)) { (result) -> Void in
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let homeModel = Mapper<HomeModel>().map(JSONString: json)
                
                completionHandler(homeModel!)
                
            case let .failure(error):
                
                var homeModel = HomeModel()
                homeModel.message = error.errorDescription
                
                completionHandler(homeModel)
            }
        }
    }
}
