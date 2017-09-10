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

        self.tabBarController?.delegate = self
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home_inactive.png"), selectedImage: UIImage(named: "ic_home_active.png"))
        
        let categoryViewController = HomeViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(named: "ic_home_inactive.png"), selectedImage: UIImage(named: "ic_home_active.png"))
        
        let profileViewController = HomeViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic_home_inactive.png"), selectedImage: UIImage(named: "ic_home_active.png"))
        
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

extension MainViewController : UITabBarControllerDelegate {
     override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Home" {
            print("homeeey")
        } else if item.title == "Categories" {
            item.title = "Categories"
        }else if item.title == "Profile" {
            item.title = "Profile"
        }
    }
}
