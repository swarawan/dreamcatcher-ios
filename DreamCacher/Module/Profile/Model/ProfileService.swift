//
//  ProfileService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/14/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import Moya

class ProfileService {
    func getProfile(completionHandler: @escaping (ProfileModel) -> Void) {
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getProfile()) { (result) -> Void in
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let profileModel = Mapper<ProfileModel>().map(JSONString: json)
                
                completionHandler(profileModel!)
                
            case let .failure(error):
                
                let profileModel = ProfileModel()
                profileModel.message = error.errorDescription
                
                completionHandler(profileModel)
            }
        }
    }
    
    func getAllArticleByUser(param: ProfileParam, completionHandler: @escaping (HomeModel) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getArticlesByUser(request: param)) { (result) -> Void in
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
    
    func getBookmark(completionHandler: @escaping (BookmarkModel) -> Void) {
        
        let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getBookmark()) { (result) -> Void in
            switch result {
            case let .success(response):
                
                let json: String = JSON(response.data).rawString()!
                let bookmarkModel = Mapper<BookmarkModel>().map(JSONString: json)
                
                completionHandler(bookmarkModel!)
                
            case let .failure(error):
                
                var bookmarkModel = BookmarkModel()
                bookmarkModel.message = error.errorDescription
                
                completionHandler(bookmarkModel)
            }
        }
    }
    
}
