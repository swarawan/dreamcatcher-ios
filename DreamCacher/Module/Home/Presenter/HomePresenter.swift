//
//  HomePresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/8/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation

protocol HomeDelegate : NSObjectProtocol {
    func nextSingleArticle()
    func displayArticles(articles: [ArticleModel])
    func displayInterest()
    func onError(message: String)
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
    
    func loadArticles() {
        self.delegate?.startLoading()
        service.getAllArticle(completionHandler: { homeModel in
            if homeModel.success! {
                self.delegate?.displayArticles(articles: homeModel.posts!)
            } else {
                self.delegate?.onError(message: homeModel.message!)
            }
        })
    }
}
