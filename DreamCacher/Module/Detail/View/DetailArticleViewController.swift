//
//  DetailArticleViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/11/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

enum ArticleType {
    case own
    case otherUser
}

class DetailArticleViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    
    fileprivate let presenter = DetailArticlePresenter(service: DetailArticleService())
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var postId = 0
    var singleArticle = ArticleModel()
    var type: ArticleType = .own
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.backItem?.title = "Back"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        self.detailTableView.rowHeight = UITableViewAutomaticDimension
        self.detailTableView.estimatedRowHeight = 250.0
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.detailTableView.register(UINib.init(nibName: "DetailArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailArticleTableViewCell")
        
        if type == .own {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_more_horiz"), style: .plain, target: self, action: #selector(moreAction))
        } else {
            if !Token.getAccessToken().isEmpty {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "comment"), style: .plain, target: self, action: #selector(commentAction))
            }
        }
        
        self.loadingAlert.initLoading()
        self.presenter.attachView(delegate: self)
        self.presenter.loadSingleArticle(postId: postId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moreAction() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let commentMenu = UIAlertAction(title: "Comment(s)", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.commentAction()
        })
        let editMenu = UIAlertAction(title: "Edit", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            
        })
        let deleteMenu = UIAlertAction(title: "Delete", style: .destructive, handler: { (alert:UIAlertAction!) -> Void in
            
        })
        
        let cancelMenu = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(commentMenu)
        optionMenu.addAction(editMenu)
        optionMenu.addAction(deleteMenu)
        optionMenu.addAction(cancelMenu)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func commentAction() {
        
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageAction(tapGestureRecognizer:)))
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailArticleTableViewCell", for: indexPath) as! DetailArticleTableViewCell
        
        if singleArticle.id != nil {
            cell.displayItem(article: singleArticle)
            cell.profileImage.isUserInteractionEnabled = true
            cell.profileImage.addGestureRecognizer(tapGesture)
        }
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var contentHeight: CGFloat = 0.0
        if singleArticle.content != nil {
            contentHeight = (singleArticle.content?.heightWithConstrainedWidth(width: UIScreen.main.bounds.width, font: UIFont.systemFont(ofSize: 12)))!
        }
        return contentHeight + 350
    }
    
    func profileImageAction(tapGestureRecognizer: UITapGestureRecognizer) {
        let profileViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profileViewController.type = .otherUser
        profileViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}
