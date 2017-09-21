//
//  ComposeViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension ComposeViewController : CategoryDelegate {
    func displaySingleCategoryPage(category: InterestItemModel) {
        
    }
    
    func displayInterest(interest: [InterestItemModel]) {
        self.interests = interest
    }
    
    func startLoading() {
        present(loadingAlert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
