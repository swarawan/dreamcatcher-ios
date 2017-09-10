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
    
    func asDate(format: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        
        return dateFormat.date(from: self)!
    }
    
    func convertDateSystem() -> String {
        let date: Date? = self.asDate(format: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        
        return date!.asString(format: "dd MMMM yyyy")
    }
}
