//
//  LoginPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol LoginDelegate : NSObjectProtocol {
    func nextView()
    func onError(message: String)
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
    
    func login(param: LoginParam) {
        service.login(param: param, callback: { model in
            if model.success {
                self.delegate?.nextView()
            } else {
                self.delegate?.onError(message: model.message)
            }
        })
    }
}
