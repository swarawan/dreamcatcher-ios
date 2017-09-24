//
//  NetworkService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Moya

enum NetworkService {
    case login(request: LoginParam)
    case register(request: RegisterParam)
    case getArticles()
    case getArticlesByCategory(request: CategoryDetailParam)
    case getArticlesByUser(request: ProfileParam)
    case getInterests()
    case getProfile()
    case getBookmark()
    case getSingleArticle(request: DetailArticleParam)
}

let endpointClosure = { (target: NetworkService) -> Endpoint<NetworkService> in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    
    switch target {
    case .login,
         .register:
        return defaultEndpoint.adding(newHTTPHeaderFields: ["Content-Type": "application/json"])
    default:
        let accessToken = Token.getAccessToken()
        return defaultEndpoint.adding(newHTTPHeaderFields: [
            "Content-Type": "application/json",
            "Authorization": "\(accessToken)"])
    }
}

extension NetworkService : TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://private-2932ba-morpheus3.apiary-mock.com")!
//        return URL(string: "http://dreamcatcherz.herokuapp.com")!
    }
    
    public var path: String {
        switch self {
        case .login(_):
            return "/v1/login"
        case .register(_):
            return "/v1/register"
        case .getArticles(_):
            return "/v1/posts"
        case .getArticlesByCategory(let request):
            return "/v1/categories/\(request.category)"
        case .getArticlesByUser(let request):
            return "/v1/profile/\(request.userId)/posts"
        case .getInterests(_):
            return "/v1/categories"
        case .getProfile(_):
            return "/v1/ownprofile"
        case .getBookmark(_):
            return "/v1/bookmarks"
        case .getSingleArticle(let request):
            return "/v1/posts/\(request.postId)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login,
             .register:
            return .post
        case .getArticles,
             .getArticlesByCategory,
             .getArticlesByUser,
             .getProfile,
             .getBookmark,
             .getSingleArticle,
             .getInterests:
            return .get
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .login(let request):
            return [
                "email" : request.email,
                "password" : request.password
            ]
        case .register(let request):
            return [
                "name" : request.name,
                "email" : request.email,
                "password" : request.password
            ]
        case .getArticlesByCategory(_):
            return [:]
        case .getArticles,
             .getInterests,
             .getArticlesByUser,
             .getProfile,
             .getBookmark,
             .getSingleArticle:
            return [:]
        }
    }
    
    public var headers: [String : String]? {
        return [:]
        //        switch self {
        //        case .login,
        //             .register:
        //            return ["Content-type" : "application/json"]
        //        default:
        //            let accessToken: String = Token.getAccessToken()
        //            return [
        //                "Content-type" : "application/json",
        //                "Authorization" : "\(accessToken)"
        //            ]
        //        }
    }
    
    public var authorizationType: Moya.AuthorizationType {
        switch self {
        case .register,
             .login:
            return AuthorizationType.none
        default:
            return AuthorizationType.bearer
        }
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        case .register:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return Task.requestParameters(parameters: parameters!, encoding: parameterEncoding)
    }
}
