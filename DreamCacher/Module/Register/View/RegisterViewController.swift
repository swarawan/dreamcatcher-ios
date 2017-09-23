//
//  RegisterViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/3/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Material

class RegisterViewController: UIViewController {

    @IBOutlet weak var fullnameTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var retypePasswordTextField: TextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var credentialContainerView: UIView!
    
    fileprivate let presenter = RegisterPresenter(service: RegisterService())
    
    
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: ColorTheme.lightNavy)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: ColorTheme.duckEggBlue)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.white ]
        self.navigationController?.isNavigationBarHidden = false
        
        self.presenter.attachView(delegate: self)
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if passwordTextField.text!.validatePassword(confirmationPassword: retypePasswordTextField.text!) {
            let fullname: String = fullnameTextField.text!
            let email: String = emailTextField.text!
            let password: String = passwordTextField.text!
            let param = RegisterParam(name: fullname, email: email, password: password)
            
            presenter.register(param: param)
        }
    }
}

extension RegisterViewController {
    func setupView() {
        self.loadingAlert.initLoading()
        
        self.credentialContainerView.backgroundColor = UIColor(hex: ColorTheme.white)
        self.credentialContainerView.layer.cornerRadius = 30.0
        
        self.submitButton.layer.cornerRadius = 20.0
        self.submitButton.layer.borderWidth = 1.0
        self.submitButton.layer.borderColor = UIColor(hex: ColorTheme.white).cgColor
        
        self.fullnameTextField.placeholder = "Full Name"
        self.fullnameTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.fullnameTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.fullnameTextField.clearButtonMode = .whileEditing
        
        self.emailTextField.placeholder = "Email"
        self.emailTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.clearButtonMode = .whileEditing
        
        self.passwordTextField.placeholder = "Password"
        self.passwordTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.clearButtonMode = .whileEditing
        
        self.retypePasswordTextField.placeholder = "Password Confirmation"
        self.retypePasswordTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.retypePasswordTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.retypePasswordTextField.clearButtonMode = .whileEditing
    }
}
