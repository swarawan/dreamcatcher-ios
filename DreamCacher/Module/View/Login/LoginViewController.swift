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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        setupView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func loginAction(_ sender: Any) {
    }
    
    @IBAction func joinNowAction(_ sender: Any) {
        let registerViewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @IBAction func laterAction(_ sender: Any) {
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
}
