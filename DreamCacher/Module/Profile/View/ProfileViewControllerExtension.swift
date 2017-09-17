//
//  ProfileViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/14/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension ProfileViewController : ProfileDelegate {
    func displayProfile(profile: ProfileModel) {
        self.nameLabel.text = profile.name
        self.addressLabel.text = profile.address
        self.bioLabel.text = profile.bio
        self.photoImage.image = UIImage().getAvatar(id: profile.avatarId!)
        self.coverImage.image = UIImage().getCoverProgile(id: profile.coverPhotoId!)
    }
    
    func displayUserPosts(articles: [ArticleModel]) {
        self.articles = articles
        self.articleTable.reloadData()
        
        self.totalPostLabel.text = "\(articles.count) Post(s)"
    }
    
    func nextSingleArticle(article: ArticleModel) {
        let detailArticleViewController = DetailArticleViewController(nibName: "DetailArticleViewController", bundle: nil)
        detailArticleViewController.article = article
        detailArticleViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(detailArticleViewController, animated: true)
    }
    
    func startLoading() {
        present(loadingAlert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
