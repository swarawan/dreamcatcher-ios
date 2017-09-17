//
//  CategoryDetailViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/13/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension CategoryDetailViewController : CategoryDetailDelegate {
    
    func nextSingleArticle(article: ArticleModel) {
        let detailArticleViewController = DetailArticleViewController(nibName: "DetailArticleViewController", bundle: nil)
        detailArticleViewController.article = article
        detailArticleViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(detailArticleViewController, animated: true)
    }
    
    func displayArticles(articles: [ArticleModel]) {
        self.articles = articles
        self.articleTable.reloadData()
    }
    
    func startLoading() {
        present(loadingAlert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
