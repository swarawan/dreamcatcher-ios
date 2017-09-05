//
//  HomeModel.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

struct HomeModel {
    var articles: [Article]
}

struct Article {
    var id: Int
    var post_title: String
    var id_background: Int
    var categories: String
    var content: String
    var published_at : String
}
