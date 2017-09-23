//
//  SelectCategoryViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/17/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension SelectCategoryViewController : CategoryDelegate {
    
    func displaySingleCategoryPage(category: InterestItemModel) {
        
    }
    
    func displayInterest(interest: [InterestItemModel]) {
        parseSelectedInterest()
        for value in interest {
            var selected: Bool = false
            if isInterestSelected(interest: value.category!) {
                selected = true
            }
            categories.append(SelectCategoryModel(interest: value, selected: selected))
        }
        selectCategoryTable.reloadData()
    }
    
    func startLoading() {
        if !loadingAlert.isBeingDismissed {
            present(loadingAlert, animated: true, completion: nil)
        }
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
    
    func isInterestSelected(interest: String) -> Bool {
        for value in selectedInterest {
            if value == interest {
                return true
            }
        }
        return false
    }
    
    func parseSelectedInterest() {
        let interestString: String = Interest.getInterests()
        for value in interestString.components(separatedBy: ",") {
            if value != "" {
                selectedInterest.append(value)
            }
        }
    }
}

