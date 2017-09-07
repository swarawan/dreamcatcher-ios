//
//  String.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/5/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension String {
    func validatePassword(confirmationPassword password: String) -> Bool{
        return self == password
    }
}
