//
//  CategoryDetailPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/13/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation

protocol CategoryDetailDelegate : NSObjectProtocol {
    func nextSingleArticle(article: ArticleModel)
    func displayArticles(articles: [ArticleModel])
    func startLoading()
    func stopLoading()
}

class CategoryDetailPresenter {
    weak private var delegate: CategoryDetailDelegate?
    private let service: CategoryDetailService
    
    init(service: CategoryDetailService) {
        self.service = service
    }
    
    func attachView(delegate: CategoryDetailDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadSingleArticle(article: ArticleModel) {
        self.delegate?.nextSingleArticle(article: article)
    }
    
    func loadArticles(category: String) {
        self.delegate?.startLoading()
        let param = CategoryDetailParam(category: category)
        service.getAllArticleByCategory(param: param, completionHandler: { detailModel in
            self.delegate?.stopLoading()
            if detailModel.success! {
                self.delegate?.displayArticles(articles: detailModel.posts!)
            }
        })
    }
}
