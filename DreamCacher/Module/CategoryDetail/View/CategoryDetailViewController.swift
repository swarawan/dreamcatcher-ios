//
//  CategoryDetailViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/13/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    @IBOutlet weak var articleTable: UITableView!
    
    fileprivate let presenter = CategoryDetailPresenter(service: CategoryDetailService())
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var interest = InterestItemModel()
    var articles = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 80))
        header.image = UIImage().getInterestImage(id: interest.backgroundId!)
        header.contentMode = .center
        
        self.articleTable.delegate = self
        self.articleTable.dataSource = self
        self.articleTable.tableHeaderView = header
        self.articleTable.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        // setup navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "compose"), style: .plain, target: self, action: #selector(composeAction))
        
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        presenter.loadArticles(category: interest.category!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func composeAction() {
        let composeViewController = ComposeViewController(nibName: "ComposeViewController", bundle: nil)
        composeViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(composeViewController, animated: true)
    }
}

extension CategoryDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
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
