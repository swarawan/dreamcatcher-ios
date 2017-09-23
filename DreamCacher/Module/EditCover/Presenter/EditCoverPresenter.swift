//
//  EditCoverPresenter.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/22/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

protocol EditCoverDelegate : NSObjectProtocol {
    func displayCover(covers: [CoverModel])
}


class EditCoverPresenter {
    weak private var delegate: EditCoverDelegate?

    func attachView(delegate: EditCoverDelegate) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func loadCovers() {
        let covers = [
            CoverModel(image: #imageLiteral(resourceName: "cover-1")),
            CoverModel(image: #imageLiteral(resourceName: "cover-2")),
            CoverModel(image: #imageLiteral(resourceName: "cover-3")),
            CoverModel(image: #imageLiteral(resourceName: "cover-4")),
            CoverModel(image: #imageLiteral(resourceName: "cover-5"))
        ]
        delegate?.displayCover(covers: covers)
    }
}
