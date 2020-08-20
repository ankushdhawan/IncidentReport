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
    @IBOutlet weak var idLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(model:IncidentModel)
    {
        machineNameLabel.text = "Machine name: " + model.machineName
        idLabel.text = "Incident Id: " + String(model.incidentId)
        dateLabel.text = "Incident Date: " +  Constant.convertToString(date: model.date, dateformat: Constant.dateFormat)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
