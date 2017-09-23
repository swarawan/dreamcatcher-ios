//
//  EditCoverViewController.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/22/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class EditCoverViewController: UIViewController {

    @IBOutlet weak var coverTable: UITableView!
    var presenter = EditCoverPresenter()
    let loadingAlert = UIAlertController(title: nil, message: "Please wait", preferredStyle: .alert)
    var covers = [CoverModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.coverTable.delegate = self
        self.coverTable.dataSource = self
        self.coverTable.register(UINib.init(nibName: "EditCoverTableViewCell", bundle: nil), forCellReuseIdentifier: "EditCoverTableViewCell")
        
        self.loadingAlert.initLoading()
        self.presenter.attachView(delegate: self)
        self.presenter.loadCovers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EditCoverViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! EditCoverTableViewCell
            self.navigationController?.popViewController(animated: true)
        // do request api to change cover
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditCoverTableViewCell", for: indexPath) as! EditCoverTableViewCell
        cell.displayCover(cover: covers[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
