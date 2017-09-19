//
//  MainViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 8/29/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var articleTable: UITableView!
    
    fileprivate let presenter = HomePresenter(service: ArticleService())
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var articles = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        self.articleTable.delegate = self
        self.articleTable.dataSource = self
        self.articleTable.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        // setup navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: .plain, target: self, action: #selector(composeAction))
        if Token.getAccessToken().isEmpty {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginAction))
        } else {
            self.navigationItem.setHidesBackButton(true, animated: true)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        }
        
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        presenter.loadArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginAction() {
        
    }
    
    func composeAction() {
        
    }
    
    func editAction() {
        let selectCategoryViewController = SelectCategoryViewController(nibName: "SelectCategoryViewController", bundle: nil)
        selectCategoryViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(selectCategoryViewController, animated: true)
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.displayItem(article: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        presenter.loadSingleArticle(article: article)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}

//extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//    }
//}
