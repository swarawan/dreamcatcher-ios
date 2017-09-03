//
//  InterestViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/3/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController {
    
    @IBOutlet weak var blurryView: UIView!
    
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

extension InterestViewController {
    func setupView() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.blurryView.backgroundColor = UIColor.clear
        self.blurryView.alpha = 0.8
        self.blurryView.addSubview(blurEffectView)
    }
}
