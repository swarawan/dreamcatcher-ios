//
//  ProfileViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/7/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

enum ProfileType {
    case own
    case otherUser
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var articleTable: UITableView!
    @IBOutlet weak var totalPostLabel: UILabel!
    @IBOutlet weak var postSegment: UISegmentedControl!
    
    let presenter = ProfilePresenter(service: ProfileService())
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var articles = [ArticleModel]()
    var type: ProfileType = .own
    var userId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup navigation bar
        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.isTranslucent = false
        
        articleTable.delegate = self
        articleTable.dataSource = self
        articleTable.register(UINib.init(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        
        if !Token.getAccessToken().isEmpty {
            presenter.loadProfile()
        } else {
            userMustSignIn()
        }
        
        checkProfileType()
    }
    
    func userMustSignIn() {
        let alertController = UIAlertController(title: "Dreamcatcher", message: "You must login to use this feature!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Sign In Now", style: .default, handler: { action in
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            loginViewController.hidesBottomBarWhenPushed = true
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: { action in
            self.parent?.tabBarController?.selectedIndex = 0
        })
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if postSegment.selectedSegmentIndex == 0 {
            presenter.loadArticle(userId: userId)
        } else if postSegment.selectedSegmentIndex == 1 {
            presenter.loadBookmark()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkProfileType() {
        switch type {
        case .otherUser:
            postSegment.removeSegment(at: 1, animated: true)
        case .own:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "compose"), style: .plain, target: self, action: #selector(composeAction))
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "setting"), style: .plain, target: self, action: #selector(editAction))
        }
    }
    
    func composeAction() {
        let composeViewController = ComposeViewController(nibName: "ComposeViewController", bundle: nil)
        composeViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(composeViewController, animated: true)
    }
    
    func editAction() {
        let editProfileViewController = EditProfileViewController(nibName: "EditProfileViewController", bundle: nil)
        editProfileViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.displayArticle(article: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        var articleType: ArticleType = .own
        if type == .otherUser {
            articleType = .otherUser
        }
        presenter.loadSingleArticle(article: article, type: articleType)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

