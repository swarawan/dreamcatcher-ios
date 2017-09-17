//
//  CategoryViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/12/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension CategoryViewController : CategoryDelegate {
    func displaySingleCategoryPage(category: InterestItemModel) {
        let categoryDetailViewController = CategoryDetailViewController(nibName: "CategoryDetailViewController", bundle: nil)
        categoryDetailViewController.interest = category
        categoryDetailViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(categoryDetailViewController, animated: true)
    }
    
    func displayInterest(interest: [InterestItemModel]) {
        self.interests = interest
        self.categoryTable.reloadData()
    }
    
    func startLoading() {
        present(loadingAlert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
