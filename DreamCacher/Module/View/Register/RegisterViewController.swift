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

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var retypePasswordTextField: TextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var credentialContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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

}

extension RegisterViewController {
    func setupView() {
        self.credentialContainerView.backgroundColor = UIColor(hex: ColorTheme.white)
        self.credentialContainerView.layer.cornerRadius = 30.0
        
        self.submitButton.layer.cornerRadius = 20.0
        self.submitButton.layer.borderWidth = 1.0
        self.submitButton.layer.borderColor = UIColor(hex: ColorTheme.white).cgColor
        
        self.emailTextField.placeholder = NSLocalizedString("Email", comment: "")
        self.emailTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.emailTextField.clearButtonMode = .whileEditing
        
        self.passwordTextField.placeholder = NSLocalizedString("Password", comment: "")
        self.passwordTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.passwordTextField.clearButtonMode = .whileEditing
        
        self.retypePasswordTextField.placeholder = NSLocalizedString("Re-Type Password", comment: "")
        self.retypePasswordTextField.dividerActiveColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.retypePasswordTextField.dividerNormalColor = UIColor(hex: ColorTheme.lightBlueGrey)
        self.retypePasswordTextField.clearButtonMode = .whileEditing
    }

}
