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
    static let recordAdded = "Record added successfully"
    static let recordNotAdded = "Error occur in DB"
    static let AppTitle = "Incident Report"

    static let NoRecordExis = "No record found"
    static let dateFormat = "MMM dd yyyy HH:mm:ss"
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
    /// Convert Date to String
    static func convertToString(date: Date, dateformat formatType: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType
        let newDate: String = dateFormatter.string(from: date)
        return newDate
    }
}
