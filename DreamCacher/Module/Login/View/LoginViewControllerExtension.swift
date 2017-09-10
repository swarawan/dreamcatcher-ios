//
//  LoginViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/4/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension LoginViewController : LoginDelegate {
    
    func displayMainView() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController = MainViewController()
        
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = rootViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    func displayInterestView() {
        let interestViewController = InterestViewController(nibName: "InterestViewController", bundle: nil)
        self.navigationController?.pushViewController(interestViewController, animated: true)
    }
    
    func displayRegisterView() {
        let registerViewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
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
