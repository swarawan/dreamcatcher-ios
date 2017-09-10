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
    case getInterests()
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
        case .getInterests(_):
            return "/v1/categories"
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
        case .getInterests(_):
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
        }
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        switch self{
        case .login:
            return URLEncoding.default
        case .register:
            return URLEncoding.default
        case .getArticles():
            return URLEncoding.default
        case .getInterests():
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
