//
//  LoginViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 8/31/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Material
import Hue

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var credentialContainerView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    fileprivate let presenter = LoginPresenter(service: LoginService())
    
    let loading: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.attachView(delegate: self)
        
        setupView()
        setupLoadingView()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailTextField.text!
        let password: String = passwordTextField.text!
        let param = LoginParam(email: email, password: password)
        
        presenter.login(param: param)
    }
    
    @IBAction func joinNowAction(_ sender: Any) {
        presenter.displayRegisterView()
    }
    
    @IBAction func laterAction(_ sender: Any) {
        presenter.displayInterestPage()
    }
}

extension LoginViewController {
    func setupView() {
        self.credentialContainerView.backgroundColor = UIColor(hex: ColorTheme.white)
        self.credentialContainerView.layer.cornerRadius = 30.0
        
        self.loginButton.layer.cornerRadius = 20.0
        self.loginButton.layer.borderWidth = 1.0
        self.loginButton.layer.borderColor = UIColor(hex: ColorTheme.white).cgColor
        
        self.emailTextField.placeholder = NSLocalizedString("Email", comment: "")
        self.emailTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.clearButtonMode = .whileEditing
        
        self.passwordTextField.placeholder = NSLocalizedString("Password", comment: "")
        self.passwordTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.clearButtonMode = .whileEditing
    }
    
    func setupLoadingView() {
        self.loading.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.loading.center = self.view.center
        self.loading.hidesWhenStopped = true
        self.loading.activityIndicatorViewStyle = .whiteLarge
        
        self.view.addSubview(self.loading)
    }
}
