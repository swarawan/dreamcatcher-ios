//
//  UIImage.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/10/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension UIImage {
    func getAvatar(id: Int) -> UIImage {
        switch id {
        case 1:
            return #imageLiteral(resourceName: "boy-1")
        case 2:
            return #imageLiteral(resourceName: "boy-2")
        case 3:
            return #imageLiteral(resourceName: "girl-1")
        case 4:
            return #imageLiteral(resourceName: "girl-2")
        case 5:
            return #imageLiteral(resourceName: "man-1")
        case 6:
            return #imageLiteral(resourceName: "man-2")
        case 7:
            return #imageLiteral(resourceName: "man-3")
        case 8:
            return #imageLiteral(resourceName: "man-4")
        default:
            return #imageLiteral(resourceName: "man-5")
        }
    }
    
    func getPostBackground(id: Int) -> UIImage {
        switch id {
        case 1:
            return #imageLiteral(resourceName: "blue")
        case 2:
            return #imageLiteral(resourceName: "green")
        case 3:
            return #imageLiteral(resourceName: "red")
        case 4:
            return #imageLiteral(resourceName: "violet")
        default:
            return #imageLiteral(resourceName: "yellow")
        }
    }
    
    func getInterestImage(id: Int) -> UIImage {
        if id == 1 {
            return #imageLiteral(resourceName: "Courses")
        } else if id == 2 {
            return #imageLiteral(resourceName: "Opportunities")
        } else if id == 3 {
            return #imageLiteral(resourceName: "Facilities")
        } else if id == 4 {
            return #imageLiteral(resourceName: "Finances")
        } else {
            return #imageLiteral(resourceName: "Skills")
        }
    }
    
    func getCoverProgile(id: Int) -> UIImage {
        if id == 1 {
            return #imageLiteral(resourceName: "cover-1")
        } else if id == 2 {
            return #imageLiteral(resourceName: "cover-2")
        } else if id == 3 {
            return #imageLiteral(resourceName: "cover-3.1")
        } else if id == 4 {
            return #imageLiteral(resourceName: "cover-4")
        } else {
            return #imageLiteral(resourceName: "cover-5")
        }
    }
}
