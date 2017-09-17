//
//  CategoryPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/12/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol CategoryDelegate : NSObjectProtocol {
    func displaySingleCategoryPage(category: InterestItemModel)
    func displayInterest(interest: [InterestItemModel])
    func startLoading()
    func stopLoading()
}

class CategoryPresenter {
    weak private var delegate: CategoryDelegate?
    private let service: InterestService
    
    init(service: InterestService) {
        self.service = service
    }
    
    func attachView(delegate: CategoryDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func displaySingleCategory(category: InterestItemModel) {
        self.delegate?.displaySingleCategoryPage(category: category)
    }
    
    func loadInterest() {
        
        self.delegate?.startLoading()
        service.loadInterest(completionHandler: { interestModel in
            self.delegate?.stopLoading()
            if interestModel.success! {
                self.delegate?.displayInterest(interest: interestModel.interests!)
            }
        })
    }
}

