//
//  LoginViewModel.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol {
    func checkFieldsValidation(userName:String,password:String)->String?
    func checkStringAlphabeticOrNot(data:String) -> Bool
}
class LoginViewModel:LoginViewModelProtocol {
    var validation = Validation()
    
    func checkFieldsValidation(userName: String, password: String)->String? {
        if let validUser = validation.validateUserName(name: userName)
        {
            return validUser.errorMessage()
        } else if let validPassword = validation.validateUserName(name: password) {
            return validPassword.errorMessage()
        }
        return nil
    }
    
    func checkStringAlphabeticOrNot(data:String) -> Bool
    {
        do {
            let regex = try NSRegularExpression(pattern: Constant.UserNameRegx, options: [])
            if regex.firstMatch(in: data, options: [], range: NSMakeRange(0, data.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
    
}
