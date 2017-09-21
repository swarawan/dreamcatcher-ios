//
//  MainViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/10/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home"), selectedImage: #imageLiteral(resourceName: "home-selected"))
        
        let categoryViewController = CategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: "Category", image: #imageLiteral(resourceName: "categories"), selectedImage: #imageLiteral(resourceName: "categories-selected"))
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), selectedImage: #imageLiteral(resourceName: "profile-selected"))
        
        let viewControllerList = [
            homeViewController,
            categoryViewController,
            profileViewController
        ]
        
        viewControllers = viewControllerList.map { viewController in
            UINavigationController(rootViewController: viewController)
        }
    }
}
