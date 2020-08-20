//
//  HomeViewModel.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
protocol HomeViewModelProtocol {
    var vc:HomeProtocol{
        get
        set
    }
    var dataSource:HomeDataSourceProtocol {
        get
        set
    }
    func fetchIncidents(completionHandler: @escaping () -> Void)
    func searchText(serach:String)
}
class HomeViewModel:HomeViewModelProtocol {
    var dataSource: HomeDataSourceProtocol
    var gateways:IncidentGateWayProtocol
    var vc:HomeProtocol
    var models:[IncidentModel]?
    var filterModels:[IncidentModel]?
    
    init(gateway:IncidentGateWayProtocol,vc:HomeProtocol,dataSource:HomeDataSourceProtocol) {
        gateways = gateway
        self.vc = vc
        self.dataSource = dataSource
    }
    func fetchIncidents(completionHandler: @escaping () -> Void)
    {
        gateways.fetchIncidents {[weak self] (arrModel) in
            guard  arrModel?.count ?? 0 > 0 else {
                self?.vc.noRecordAdded()
                return
            }
            self?.models = arrModel!
            self?.filterModels = arrModel!
            self?.dataSource.models = arrModel!
            completionHandler()
        }
    }
    func searchText(serach: String)  {
        // let list3 = models?.filter{ ($0.machineName.range(of: serach, options: .caseInsensitive) != nil) }
        let list3 = self.models?.filter({ (mode) -> Bool in
            let idStr = String(mode.incidentId)
            let dateStr = Constant.convertToString(date: mode.date, dateformat: Constant.dateFormat).lowercased()
            return mode.machineName.lowercased().range(of: serach.lowercased()) != nil ||
                idStr.lowercased().range(of: serach.lowercased()) != nil ||
                dateStr.range(of: serach.lowercased()) != nil ||
                dateStr.contains(serach.lowercased())
            // Add the rest as needed.
        })
        
        if list3?.count ?? 0 > 0 {
            self.dataSource.models = list3!
        } else {
            self.dataSource.models = models!
        }
    }
}
