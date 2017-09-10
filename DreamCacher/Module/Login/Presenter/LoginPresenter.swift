//
//  LoginPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol LoginDelegate : NSObjectProtocol {
    func displayMainView()
    func displayRegisterView()
    func displayInterestView()
    func onError(message: String)
    func startLoading()
    func stopLoading()
}

class LoginPresenter {
    weak private var delegate: LoginDelegate?
    private let service: LoginService
    
    init(service: LoginService) {
        self.service = service
    }
    
    func attachView(delegate: LoginDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func checkLoggedUser() {
        if !Token.getAccessToken().isEmpty {
            self.delegate?.displayMainView()
        }
    }
    
    func displayRegisterView() {
        self.delegate?.displayRegisterView()
    }
    
    func displayInterestPage() {
        self.delegate?.displayInterestView()
    }
    
    func login(param: LoginParam) {
        
        self.delegate?.startLoading()
        service.login(param: param, completionHandler: { login in
            
            self.delegate?.stopLoading()
            if login.success! {
                Token.saveAccessToken(accessToken: login.token!)
                self.delegate?.displayInterestView()
            } else {
                self.delegate?.onError(message: login.message!)
            }
        })
    }
}
