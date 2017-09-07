//
//  ArticleService.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ArticleService {
    
    func getAllArticle(callback: @escaping ([HomeModel]) -> Void) {
        let headers: [String:String] = [
            "Authorization" : "Bearer abcd"
        ]
        
        Alamofire.request("http://private-2bc143-morpheus3.apiary-mock.com/v1/posts", method: .get, parameters: [:], encoding: URLEncoding(), headers: headers).responseJSON(completionHandler: { response in
            do{
                if let data = response.data {
                    let JSON = try JSONSerialization.jsonObject(with: data, options: [])
                    print(JSON)
                }
            } catch {
                
            }
        })
    }
}
