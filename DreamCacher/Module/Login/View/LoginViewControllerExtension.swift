//
//  LoginViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

extension LoginViewController : LoginDelegate {
    
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
