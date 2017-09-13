//
//  CategoryViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/12/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension CategoryViewController : CategoryDelegate {
    func displaySingleCategoryPage() {
        
    }
    
    func displayInterest(interest: [InterestItemModel]) {
        self.interests = interest
        self.categoryTable.reloadData()
    }
    
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
}
