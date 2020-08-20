//
//  IncidentGateWay.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import CoreData
protocol IncidentGateWayProtocol {
    func fetchIncidents(completionHandler: @escaping ([IncidentModel]?) -> Void)
    func add(parameters: IncidentModel, completionHandler: @escaping (IncidentModel?) -> Void)
}

class IncidentGateWay:IncidentGateWayProtocol {
    let viewContext: NSManagedObjectContextProtocol
    
    init(viewContext: NSManagedObjectContextProtocol) {
        self.viewContext = viewContext
    }
    
    func fetchIncidents(completionHandler: @escaping ([IncidentModel]?) -> Void) {
        if let coreDataIncident = try? viewContext.allEntities(withType: Incident.self) {
            let incidents = coreDataIncident.map { $0.incident }
            completionHandler(incidents)
        } else {
            completionHandler(nil)
        }
    }
    
    func add(parameters: IncidentModel, completionHandler: @escaping (IncidentModel?) -> Void) {
        guard let coreDataIncident = viewContext.addEntity(withType: Incident.self) else {
            completionHandler(nil)
            return
        }
        coreDataIncident.populate(with: parameters)
        do {
            try viewContext.save()
            completionHandler(coreDataIncident.incident)
        } catch {
            completionHandler(nil)
        }
    }
}
