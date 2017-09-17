//
//  UIAlertController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/15/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension UIAlertController {
    func initLoading() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = .gray
        loadingIndicator.startAnimating()
        
        self.view.addSubview(loadingIndicator)
    }
}
