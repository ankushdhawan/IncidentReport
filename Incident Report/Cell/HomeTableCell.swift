//
//  HomeTableCell.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    @IBOutlet weak var machineNameLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(model:IncidentModel)
    {
        machineNameLabel.text = "Machine name: " + model.machineName
        locationLabel.text = "Incident Location: " + model.location
        descriptionLabel.text = "Description: " + model.description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
