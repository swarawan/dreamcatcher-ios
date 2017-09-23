//
//  DetailArticleViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension DetailArticleViewController : DetailArticleDelegate {
    
    func displaySingleArticle(article: DetailArticleModel) {
        self.singleArticle.id = article.id
        self.singleArticle.name = article.name
        self.singleArticle.postTitle = article.postTitle
        self.singleArticle.avatar = article.avatar
        self.singleArticle.background = article.background
        self.singleArticle.categories = article.categories
        self.singleArticle.content = article.content
        self.singleArticle.publishedAt = article.publishedAt
        
        self.detailTableView.reloadData()
    }
    
    func startLoading() {
        if !loadingAlert.isBeingDismissed {
            present(loadingAlert, animated: true, completion: nil)
        }
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
