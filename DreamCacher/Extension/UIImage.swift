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
            return UIImage(named: "boy-1")!
        case 2:
            return UIImage(named: "boy-2")!
        case 3:
            return UIImage(named: "girl-1")!
        case 4:
            return UIImage(named: "girl-2")!
        case 5:
            return UIImage(named: "man-1")!
        case 6:
            return UIImage(named: "man-2")!
        case 7:
            return UIImage(named: "man-3")!
        case 8:
            return UIImage(named: "man-4")!
        default:
            return UIImage(named: "man-5")!
        }
    }
    
    func getPostBackground(id: Int) -> UIImage {
        switch id {
        case 1:
            return UIImage(named: "blue")!
        case 2:
            return UIImage(named: "green")!
        case 3:
            return UIImage(named: "red")!
        case 4:
            return UIImage(named: "violet")!
        default:
            return UIImage(named: "yellow")!
        }
    }

}
