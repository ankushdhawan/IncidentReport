//
//  AddIncidentVC.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation

protocol AddIncidentViewModelProtocol {
    var vc:AddIncidentProtocol {get set}
    var validation:Validation {
        get set
    }
    
    func addRecord(machineName:String,location:String,description:String)
    func checkFieldsValidation(machineName:String,location:String,descriptionStr:String)->String?
}
class AddIncidentViewModel:AddIncidentViewModelProtocol {
    var validation: Validation
    
    var vc: AddIncidentProtocol
    var gateways:IncidentGateWayProtocol
    init(gateway:IncidentGateWayProtocol,controller:AddIncidentProtocol,validation:Validation) {
        gateways = gateway
        vc = controller
        self.validation = validation
    }
    
    func addRecord(machineName: String, location: String, description: String) {
        let number = Int.random(in: 0..<300)
        let model = IncidentModel(machineName: machineName, description: description, location: location,incidentId: number, date: Date())
        gateways.add(parameters: model) {[weak self] (model) in
            guard model != nil else {
                self?.vc.errorOccurInDb()
                return
            }
            self?.vc.recordAddedSuccessfully()
            print(model)
        }
    }
    func checkFieldsValidation(machineName: String, location: String, descriptionStr: String) -> String? {
        if let validUser = validation.validateMachineName(name:machineName)
        {
            return validUser.errorMessage()
        } else if let validMachine = validation.validateLocationName(name: location){
            return validMachine.errorMessage()
        }else if let validDescription = validation.validateDescription(name:descriptionStr )
        {
            return validDescription.errorMessage()
        }
        return nil
    }
}
