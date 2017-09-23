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

extension NetworkService : TargetType {
    
    public var baseURL: URL {
//        return URL(string: "http://private-2932ba-morpheus3.apiary-mock.com")!
        return URL(string: "http://dreamcatcherz.herokuapp.com")!
    }
    
    public var path: String {
        switch self {
        case .login(_):
            return "/v1/login"
        case .register(_):
            return "/v1/register"
        case .getArticles(_):
            return "/v1/posts"
        case .getArticlesByCategory(_):
            return "/v1/categories/showposts"
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
        case .login(_):
            return .post
        case .register(_):
            return .post
        case .getArticles(_):
            return .get
        case .getArticlesByCategory(_):
            return .get
        case .getArticlesByUser(_):
            return .get
        case .getInterests(_):
            return .get
        case .getProfile(_):
            return .get
        case .getBookmark(_):
            return .get
        case .getSingleArticle(_):
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
        case .getArticles():
            return [:]
        case .getInterests():
            return [:]
        case .getArticlesByCategory(let request):
            return [
                "categories" : request.category
            ]
        case .getArticlesByUser(_):
            return [:]
        case .getProfile(_):
            return [:]
        case .getBookmark(_):
            return [:]
        case .getSingleArticle(_):
            return [:]
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login:
            return ["Content-type" : "application/json"]
        case .register:
            return ["Content-type" : "application/json"]
        default:
            let accessToken = Token.getAccessToken()
            return [
                "Content-type" : "application/json",
                "Authorization" : accessToken
            ]
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
