//
//  RegisterPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol RegisterDelegate {
    func displayNextView()
    func onError(message: String)
    func startLoading()
    func stopLoading()
}

class RegisterPresenter {
    private var delegate: RegisterDelegate?
    private let service: RegisterService
    
    init(service: RegisterService) {
        self.service = service
    }
    
    func attachView(delegate: RegisterDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func register(param: RegisterParam) {
        
        self.delegate?.startLoading()
        service.register(param: param, completionHandler: { success, register in
            
            self.delegate?.stopLoading()
            if register.success! {
                self.delegate?.displayNextView()
            } else {
                self.delegate?.onError(message: register.message!)
            }
        })
    }
}
