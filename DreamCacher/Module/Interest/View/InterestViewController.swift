//
//  InterestViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/8/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit
import Hue

class InterestViewController: UIViewController {

    @IBOutlet weak var interestTableView: UITableView!
    
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var presenter = InterestPresenter(service: InterestService())
    var interests = [InterestItemModel]()
    var selectedInterest = [InterestItemModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImageView(image: #imageLiteral(resourceName: "title-dreamcatcher"))
        image.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = image
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: ColorTheme.lightNavy)
        self.navigationController?.navigationBar.tintColor = UIColor(hex: ColorTheme.duckEggBlue)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.white ]
        
        if !Token.getAccessToken().isEmpty {
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
        
        self.edgesForExtendedLayout = []
        
        self.interestTableView.delegate = self
        self.interestTableView.dataSource = self
        self.interestTableView.register(UINib.init(nibName: "InterestTableViewCell", bundle: nil), forCellReuseIdentifier: "InterestTableViewCell")
        
        self.loadingAlert.initLoading()
        self.presenter.attachView(delegate: self)
        self.presenter.loadInterest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkValidInterest(){
        if selectedInterest.count >= 3 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(doneAction))
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func doneAction() {
        presenter.storeInterest(interests: selectedInterest)
        presenter.displayNextPage()
    }
    
    func addSelectedInterest(interest: InterestItemModel) {
        selectedInterest.append(interest)
    }
    
    func removeSelectedInterest(interest: InterestItemModel) {
        for (index, selected) in selectedInterest.enumerated() {
            if selected.category == interest.category {
                selectedInterest.remove(at: index)
            }
        }
    }
    
}

extension InterestViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! InterestTableViewCell
        cell.interestLabel.textColor = UIColor(hex: ColorTheme.coral)
        interestTableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        
        let selectedInterest = interests[indexPath.row]
        addSelectedInterest(interest: selectedInterest)
        checkValidInterest()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! InterestTableViewCell
        cell.interestLabel.textColor = UIColor(hex: ColorTheme.white)
        interestTableView.deselectRow(at: indexPath, animated: true)
        
        let selectedInterest = interests[indexPath.row]
        removeSelectedInterest(interest: selectedInterest)
        checkValidInterest()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestTableViewCell", for: indexPath) as! InterestTableViewCell
        cell.displayItem(interest: interests[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
}
