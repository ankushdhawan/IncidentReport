//
//  Validation.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation

import Foundation

enum ValidateError
{
    case Username
    case Password
    case Machine
    case Location
    case Description
    
    func errorMessage()->String
    {
        switch self {
        case .Username:
            return Constant.LoginError.ErrorUserName + String(Constant.ErrorLength.LengthUserName) + " Characters"
        case .Password:
            return Constant.LoginError.ErrorPasswordName + String(Constant.ErrorLength.LengthPasswordName) + " Characters"
        case .Description:
            return Constant.AddMachine.ErrorDescription
        case .Machine:
            return Constant.AddMachine.ErrorMachineName
        case .Location:
            return Constant.AddMachine.ErrorLocationName
        default:
            break
        }
    }
}

class Validation {
    
    public func validateUserName(name: String) ->ValidateError? {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        if name.count < Constant.ErrorLength.LengthUserName
        {
            return ValidateError.Username
        }
        return nil
    }
    
    public func validateMachineName(name: String) ->ValidateError? {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        if name.count <= 0
        {
            return ValidateError.Machine
        }
        return nil
    }
    
    public func validateLocationName(name: String) ->ValidateError? {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        if name.count <= 0
        {
            return ValidateError.Location
        }
        return nil
    }
    
    public func validateDescription(name: String) ->ValidateError? {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        if name.count <= 0
        {
            return ValidateError.Description
        }
        return nil
    }
    
    public func validatePassword(phoneNumber: String) -> ValidateError? {
        if phoneNumber.count < Constant.ErrorLength.LengthPasswordName
        {
            return ValidateError.Password
        }
        return nil
        
    }
    
}
