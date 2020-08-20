//
//  HomeDataSource.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDataSourceProtocol {
    var models:[IncidentModel] {
        get
        set
    }
}

class HomeDataSource:NSObject, HomeDataSourceProtocol {
    var models: [IncidentModel]
    init(models: [IncidentModel]) {
        self.models = models
        super.init()
        
    }
}

// MARK: - UITableViewDataSource
extension HomeDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as! HomeTableCell
        cell.setupData(model: models[indexPath.row])
        return cell
    }
}
