//
//  RegisterPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol RegisterDelegateView {
    func nextButton()
}

class RegisterPresenter {
    private var registerDelegateView: RegisterDelegateView?
    private var registerModel: RegisterModel
    
    init(registerModel: RegisterModel) {
        self.registerModel = registerModel
    }
    
    
}
