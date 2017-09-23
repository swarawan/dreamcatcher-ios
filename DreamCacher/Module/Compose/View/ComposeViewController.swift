//
//  ComposeViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/21/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var selectCategoryButton: UIButton!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var violetButton: UIButton!
    @IBOutlet weak var bodyTextView: UITextView!
    
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var presenter = CategoryPresenter(service: InterestService())
    var interests: [InterestItemModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView(image: #imageLiteral(resourceName: "title-edit-profile"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backItem?.title = "Back"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]
        
        // setup navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(previewAction))
        
        setupTextView()
        selectButton(button: blueButton)
        
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        presenter.loadInterest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func redAction(_ sender: UIButton) {
        selectButton(button: sender)
        featuredImage.image = #imageLiteral(resourceName: "red")
    }
    
    @IBAction func greenAction(_ sender: UIButton) {
        selectButton(button: sender)
        featuredImage.image = #imageLiteral(resourceName: "green")
    }

    @IBAction func blueAction(_ sender: UIButton) {
        selectButton(button: sender)
        featuredImage.image = #imageLiteral(resourceName: "blue")
    }
    
    @IBAction func yellowAction(_ sender: UIButton) {
        selectButton(button: sender)
        featuredImage.image = #imageLiteral(resourceName: "yellow")
    }
    
    @IBAction func violetAction(_ sender: UIButton) {
        selectButton(button: sender)
        featuredImage.image = #imageLiteral(resourceName: "violet")
    }
    
    @IBAction func selectCategoryAction(_ sender: Any) {
        selectCategoryAction()
    }
    
    func selectButton(button: UIButton) {
        redButton.layer.borderWidth = 0
        greenButton.layer.borderWidth = 0
        blueButton.layer.borderWidth = 0
        yellowButton.layer.borderWidth = 0
        violetButton.layer.borderWidth = 0
        
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 5
    }
    
    func previewAction() {
        
    }
    
    func selectCategoryAction() {
        let optionMenu = UIAlertController(title: nil, message: "Select Category", preferredStyle: .actionSheet)
        
        for interest in interests! {
            let categoryMenu = UIAlertAction(title: interest.category, style: .default, handler: { (alert:UIAlertAction!) -> Void in
                self.selectCategory(named: interest.category!)
            })
            optionMenu.addAction(categoryMenu)
        }
        
        let cancelMenu = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelMenu)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func selectCategory(named: String) {
        selectCategoryButton.titleLabel?.text = named
    }
}

extension ComposeViewController : UITextViewDelegate {
    
    func setupTextView() {
        self.bodyTextView.delegate = self
        self.bodyTextView.text = "Insert Body"
        self.bodyTextView.textColor = UIColor.gray
        
        self.titleTextView.delegate = self
        self.titleTextView.text = "Insert Title"
        self.titleTextView.textColor = UIColor.gray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Insert Body"
            textView.textColor = UIColor.gray
        }
        textView.resignFirstResponder()
    }
}

