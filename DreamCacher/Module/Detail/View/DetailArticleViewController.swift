//
//  DetailArticleViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/11/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class DetailArticleViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    var article = ArticleModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Dreamcatcher"
        self.navigationController?.navigationBar.backItem?.title = "Back"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        self.detailTableView.rowHeight = UITableViewAutomaticDimension
        self.detailTableView.estimatedRowHeight = 250.0
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.register(UINib.init(nibName: "DetailArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailArticleTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DetailArticleViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailArticleTableViewCell", for: indexPath) as! DetailArticleTableViewCell
        cell.displayItem(article: article)
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let contentHeight = (article.content?.heightWithConstrainedWidth(width: UIScreen.main.bounds.width, font: UIFont.systemFont(ofSize: 12)))!
        
        return contentHeight + 350
    }
}
