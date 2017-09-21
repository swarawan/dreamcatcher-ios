//
//  EditProfileViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView(image: #imageLiteral(resourceName: "title-edit-profile"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        // setup navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveAction))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveAction() {
        
    }
    
    @IBAction func signOut(_ sender: UIButton) {
        Token.saveAccessToken(accessToken: "")
        
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginViewController.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func chooseImageAction(_ sender: UIButton) {
    
    }
    
    @IBAction func changeImageAction(_ sender: UIButton) {
        
    }
}
