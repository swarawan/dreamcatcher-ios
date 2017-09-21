//
//  DetailArticleService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import Moya

class DetailArticleService {
    
    func getSingleArticle(param: DetailArticleParam, completionHandler: @escaping (DetailArticleModel) -> Void ) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getSingleArticle(request: param)) { (result) -> Void in
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let singleArticleModel = Mapper<DetailArticleModel>().map(JSONString: json)
                
                completionHandler(singleArticleModel!)
                
            case let .failure(error):
                
                let singleArticleModel = DetailArticleModel()
                singleArticleModel.message = error.errorDescription
                
                completionHandler(singleArticleModel)
            }
        }
    }
}
