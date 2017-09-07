//
//  RegisterViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension RegisterViewController : RegisterDelegate {
    func nextView() {
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func onError(message: String) {
        print(message)
    }
    
    func startLoading() {
        loading.startAnimating()
    }
    
    func stopLoading() {
        loading.stopAnimating()
    }
}
