//
//  HomePresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/8/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation

protocol HomeDelegate : NSObjectProtocol {
    func nextSingleArticle(article: ArticleModel)
    func displayArticles(articles: [ArticleModel])
    func displayInterest()
    func startLoading()
    func stopLoading()
}

class HomePresenter {
    weak private var delegate: HomeDelegate?
    private let service: ArticleService
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func attachView(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadInterest() {
        self.delegate?.displayInterest()
    }
    
    func loadSingleArticle(article: ArticleModel) {
        self.delegate?.nextSingleArticle(article: article)
    }
    
    func loadArticles() {
        self.delegate?.startLoading()
        service.getAllArticle(completionHandler: { homeModel in
            self.delegate?.stopLoading()
            if homeModel.success! {
                self.delegate?.displayArticles(articles: homeModel.posts!)
            }
        })
    }
}
