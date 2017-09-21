//
//  DetailArticlePresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol DetailArticleDelegate : NSObjectProtocol {
    func displaySingleArticle(article: DetailArticleModel)
    func startLoading()
    func stopLoading()
}

class DetailArticlePresenter {
    weak private var delegate: DetailArticleDelegate?
    private let service: DetailArticleService
    
    init(service: DetailArticleService) {
        self.service = service
    }
    
    func attachView(delegate: DetailArticleDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadSingleArticle(postId: Int) {
        self.delegate?.startLoading()
        
        let param = DetailArticleParam(postId: postId)
        service.getSingleArticle(param: param, completionHandler: { article in
            self.delegate?.stopLoading()
            if article.success! {
                self.delegate?.displaySingleArticle(article: article)
            }
        })
    }
}
