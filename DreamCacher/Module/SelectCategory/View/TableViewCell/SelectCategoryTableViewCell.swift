//
//  CategoryTableViewCell.swift
//  DreamCacher
//
//  Created by Rio Swarawan on 9/15/17.
//  Copyright © 2017 Rio Swarawan. All rights reserved.
//

import UIKit

class SelectCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectedNameLabel: UILabel!
    @IBOutlet weak var selectedSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayCell(model: SelectCategoryModel) {
        selectedNameLabel.text = model.interest?.category
        selectedSwitch.isOn = model.selected!
    }
}
