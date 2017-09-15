//
//  CategoryViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/12/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryTable: UITableView!
    
    var presenter = CategoryPresenter(service: InterestService())
    var interests = [InterestItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryTable.dataSource = self
        self.categoryTable.delegate = self
        self.categoryTable.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
        
        // setup navigation bar
        let image = UIImageView(image: #imageLiteral(resourceName: "Title"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Compose", style: .plain, target: self, action: #selector(composeAction))
        if Token.getAccessToken().isEmpty {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login", style: .plain, target: self, action: #selector(loginAction))
        } else {
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
        
        presenter.attachView(delegate: self)
        presenter.loadInterest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginAction() {
        
    }
    
    func composeAction() {
        
    }
}

extension CategoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let interest = interests[indexPath.row]
        presenter.displaySingleCategory(category: interest)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.displayCategory(interest: interests[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
