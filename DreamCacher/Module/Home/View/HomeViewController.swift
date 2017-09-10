//
//  MainViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 8/29/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Toast_Swift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var articleTable: UITableView!
    
    fileprivate let presenter = HomePresenter(service: ArticleService())
    var articles = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dreamcatcher"
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: ColorTheme.lightNavy)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: ColorTheme.duckEggBlue)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster Two", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.white ]
        
        self.articleTable.delegate = self
        self.articleTable.dataSource = self
        self.articleTable.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        // setup navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: .plain, target: self, action: #selector(composeAction))
        if Token.getAccessToken().isEmpty {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginAction))
        } else {
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
        
        presenter.attachView(delegate: self)
        presenter.loadArticles()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginAction() {
        self.view.makeToast("Feature not implemented yet")
    }
    
    func composeAction() {
        self.view.makeToast("Feature not implemented yet")
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}
