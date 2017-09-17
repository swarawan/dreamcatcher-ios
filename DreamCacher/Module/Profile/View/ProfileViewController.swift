//
//  ProfileViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/7/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var articleTable: UITableView!
    @IBOutlet weak var totalPostLabel: UILabel!
    
    fileprivate let presenter = ProfilePresenter(service: ProfileService())
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var articles = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup navigation bar
        let image = UIImageView(image: #imageLiteral(resourceName: "Title"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: .plain, target: self, action: #selector(composeAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editAction))
        
        articleTable.delegate = self
        articleTable.dataSource = self
        articleTable.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        presenter.loadProfile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func composeAction() {
        
    }
    
    func editAction() {
        
    }
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        return 160
    }
}

