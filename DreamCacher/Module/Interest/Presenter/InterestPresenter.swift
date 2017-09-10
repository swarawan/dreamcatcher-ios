//
//  InterestPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/9/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import Foundation

protocol InterestDelegate : NSObjectProtocol {
    func displayMainPage()
    func displayInterest(interest: [InterestItemModel])
    func onError(message: String)
    func startLoading()
    func stopLoading()
}

class InterestPresenter {
    weak private var delegate: InterestDelegate?
    private let service: InterestService
    
    init(service: InterestService) {
        self.service = service
    }
    
    func attachView(delegate: InterestDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func displayNextPage() {
        self.delegate?.displayMainPage()
    }
    
    func storeInterest(interests: [InterestItemModel]) {
        var interestBuilder: String = ""
        for value in interests {
            interestBuilder.append(value.category!)
            interestBuilder.append(",")
        }
        Interest.saveInterests(interests: interestBuilder)
    }
    
    func loadInterest() {
        
        self.delegate?.startLoading()
        service.loadInterest(completionHandler: { interestModel in
            if interestModel.success! {
                self.delegate?.displayInterest(interest: interestModel.interests!)
            } else {
                self.delegate?.onError(message: interestModel.message!)
            }
        })
    }
}

