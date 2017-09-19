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
}

extension NetworkService : TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://private-2932ba-morpheus3.apiary-mock.com")!
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
        case .getArticlesByUser(_):
            return "/v1/profile/posts"
        case .getInterests(_):
            return "/v1/categories"
        case .getProfile(_):
            return "/v1/profile"
        case .getBookmark(_):
            return "/v1/bookmarks"
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
        case .getArticlesByUser(let request):
            return [
                "id_user" : request.userId
            ]
        case .getProfile(_):
            return [:]
        case .getBookmark(_):
            return [:]
        }
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        switch self{
        case .login:
            return URLEncoding.default
        case .register:
            return URLEncoding.default
        case .getArticles:
            return URLEncoding.default
        case .getInterests:
            return URLEncoding.default
        case .getArticlesByCategory:
            return URLEncoding.default
        case .getArticlesByUser:
            return URLEncoding.default
        case .getProfile():
            return URLEncoding.default
        case .getBookmark(_):
            return URLEncoding.default
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .request
    }
    
    public var headers: [String : String] {
        return ["Content-type" : "application/json"]
    }
    
}
