//
//  SelectCategoryViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/15/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class SelectCategoryViewController: UIViewController {

    @IBOutlet weak var selectCategoryTable: UITableView!
    
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var presenter = CategoryPresenter(service: InterestService())
    var categories = [SelectCategoryModel]()
    var selectedInterest: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dreamcatcher"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster", size: 18)!,
                                                                         NSForegroundColorAttributeName: UIColor.black ]

        selectCategoryTable.delegate = self
        selectCategoryTable.dataSource = self
        selectCategoryTable.register(UINib.init(nibName: "SelectCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectCategoryTableViewCell")
        selectCategoryTable.register(UINib.init(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        
        loadingAlert.initLoading()
        presenter.attachView(delegate: self)
        presenter.loadInterest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        storeInterest()
    }
    
    func storeInterest() {
        var interestBuilder: String = ""
        for index in 0...categories.count - 1 {
            let cell = selectCategoryTable.cellForRow(at: IndexPath(row: index, section: 0)) as! SelectCategoryTableViewCell
            if cell.selectedSwitch.isOn {
                interestBuilder.append(cell.selectedNameLabel.text!)
                interestBuilder.append(",")
            }
        }
        Interest.saveInterests(interests: interestBuilder)
    }
}

extension SelectCategoryViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (categories.count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < categories.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCategoryTableViewCell", for: indexPath) as! SelectCategoryTableViewCell
            cell.displayCell(model: categories[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < categories.count {
            return 50
        } else {
            return 60
        }
    }

}
