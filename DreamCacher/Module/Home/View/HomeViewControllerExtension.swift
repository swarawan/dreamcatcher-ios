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
    
    func nextSingleArticle(article: ArticleModel) {
        let detailArticleViewController = DetailArticleViewController(nibName: "DetailArticleViewController", bundle: nil)
        detailArticleViewController.article = article
        detailArticleViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(detailArticleViewController, animated: true)
    }
    
    func displayInterest() {
//        let selectedInterest = Interest.getInterests()
//        let interests = selectedInterest.components(separatedBy: ",")
//        
//        for interest in interests {
//            var label = UILabel()
//            label.text = interest
//            label.backgroundColor = UIColor.gray
//            
//            self.scroll
//        }
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
