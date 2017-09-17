//
//  ProfilePresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/14/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol ProfileDelegate : NSObjectProtocol {
    func displayProfile(profile: ProfileModel)
    func displayUserPosts(articles: [ArticleModel])
    func nextSingleArticle(article: ArticleModel)
    func startLoading()
    func stopLoading()
}

class ProfilePresenter {
    weak private var delegate: ProfileDelegate?
    private let service: ProfileService
    
    init(service: ProfileService) {
        self.service = service
    }
    
    func attachView(delegate: ProfileDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadSingleArticle(article: ArticleModel) {
        self.delegate?.nextSingleArticle(article: article)
    }
    
    func loadProfile() {
        self.delegate?.startLoading()
        service.getProfile(completionHandler: { profileModel in
            self.delegate?.stopLoading()
            if profileModel.success! {
                self.delegate?.displayProfile(profile: profileModel)
                self.loadArticle(userId: profileModel.userId!)
            }
        })
    }
    
    private func loadArticle(userId: Int) {
        let param = ProfileParam(userId: userId)
     
        self.delegate?.startLoading()
        service.getAllArticleByUser(param: param, completionHandler: { homeModel in
            self.delegate?.stopLoading()
            if homeModel.success! {
                self.delegate?.displayUserPosts(articles: homeModel.posts!)
            }
        })
    }
}

