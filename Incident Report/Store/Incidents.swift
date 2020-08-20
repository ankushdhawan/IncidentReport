//
//  Incidents.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import CoreData
extension Incident
{
    var incident: IncidentModel {
        return IncidentModel(machineName: machineName ?? "", description: descriptionData ?? "", location: location ?? "",incidentId: Int(incidentId), date: timeStamp ?? Date())
    }
    
    func populate(with incidentObj: IncidentModel) {
        machineName = incidentObj.machineName
        descriptionData = incidentObj.description
        location = incidentObj.location
        incidentId = Int64(incidentObj.incidentId)
        timeStamp = incidentObj.date
        
    }
}
