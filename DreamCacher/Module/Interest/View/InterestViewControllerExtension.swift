//
//  InterestViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/9/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension InterestViewController : InterestDelegate {
    
    func displayMainPage() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController = MainViewController()
        
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = rootViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func displayInterest(interest: [InterestItemModel]) {
        self.interests = interest
        self.interestTableView.reloadData()
    }
    
    func onError(message: String) {
        
    }
}
