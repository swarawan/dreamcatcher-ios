//
//  EditCoverViewControllerExtension.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/22/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

extension EditCoverViewController : EditCoverDelegate {
    func displayCover(covers: [CoverModel]) {
        self.covers = covers
        self.coverTable.reloadData()
    }
}
