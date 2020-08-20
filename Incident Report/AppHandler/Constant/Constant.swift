//
//  Const.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation

struct  Constant
{
    static let ErrorTitle = "Error"
    
    struct LoginError {
        
        static let ErrorUserName = "Please enter username atleast "
        static let ErrorPasswordName = "Please enter password atleast "
    }
    struct AddMachine {
        static let ErrorMachineName = "Please enter machine name "
        static let ErrorLocationName = "Please enter Location "
        static let ErrorDescription = "Please enter Description "
        
    }
    struct ErrorLength {
        static let LengthUserName =  8
        static let LengthPasswordName = 8
    }
    
}
