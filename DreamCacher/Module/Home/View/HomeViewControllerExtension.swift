//
//  HomeViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/8/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Toast_Swift

extension HomeViewController : HomeDelegate {
    
    func nextSingleArticle() {
        
    }
    
    func displayArticles(articles: [ArticleModel]) {
        self.articles = articles
        self.articleTable.reloadData()
    }
    
    func onError(message: String) {
        if !message.isEmpty {
            self.view.makeToast(message)
        }
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
}
