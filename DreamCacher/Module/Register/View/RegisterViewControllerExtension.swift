//
//  RegisterViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension RegisterViewController : RegisterDelegate {
    
    func displayNextView() {
        let interestViewController = InterestViewController(nibName: "InterestViewController", bundle: nil)
        self.navigationController?.pushViewController(interestViewController, animated: true)
    }
    
    func startLoading() {
        present(loadingAlert, animated: true, completion: nil)
    }
    
    func stopLoading() {
        dismiss(animated: true, completion: nil)
    }
}
