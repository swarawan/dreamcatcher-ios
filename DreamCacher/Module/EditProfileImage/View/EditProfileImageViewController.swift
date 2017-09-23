//
//  EditProfileImageViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/23/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class EditProfileImageViewController: UIViewController {

    @IBOutlet weak var avatarCollectionView: UICollectionView!
    
    let presenter = EditProfileImagePresenter()
    var avatars = [EditProfileImageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
        avatarCollectionView.register(UINib.init(nibName: "EditProfileImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EditProfileImageCollectionViewCell")
        
        presenter.attachView(delegate: self)
        presenter.loadAvatar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EditProfileImageViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EditProfileImageCollectionViewCell", for: indexPath) as! EditProfileImageCollectionViewCell
        cell.displayAvatar(avatar: avatars[indexPath.row])
        
        return cell
    }
}
