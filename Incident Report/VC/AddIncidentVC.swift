//
//  AddIncidentVC.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import UIKit
protocol AddIncidentProtocol {
    func recordAddedSuccessfully()
    func errorOccurInDb()
}

class AddIncidentVC: UIViewController,Storyboarded {
    //Mark:IBOUTLET OBJECTS
    @IBOutlet weak var machineNameTextField:UITextField!
    @IBOutlet weak var locationTextField:UITextField!
    @IBOutlet weak var descriptionTextView:UITextView!
    @IBOutlet weak var submitButton:UIButton!
    
    //Mark:OBJECTS
    var coordinator: MainCoordinator?
    var viewModel:AddIncidentViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //Mark:IBACTION METHOD(S)
    
    /// Submit Action
    /// - Parameter sender: UIBUtton Instance
    @IBAction func submitButtonTapped(sender:UIButton)
    {
        if let message = viewModel?.checkFieldsValidation(machineName: machineNameTextField.text!, location:locationTextField.text!, descriptionStr: descriptionTextView.text!){
            self.presentAlertWithTitle(title: Constant.ErrorTitle, message: message, options: "OK") {_ in
            }
            return
        }
        viewModel?.addRecord(machineName:machineNameTextField.text! , location: locationTextField.text!, description: descriptionTextView.text!)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension AddIncidentVC:AddIncidentProtocol
{
    func recordAddedSuccessfully() {
        self.presentAlertWithTitle(title: "", message: Constant.recordAdded, options: "OK") {[weak self]_ in
            self?.navigationController?.popViewController(animated: true)
            
        }
    }
    
    func errorOccurInDb() {
        self.presentAlertWithTitle(title: "", message: Constant.recordNotAdded, options: "OK") {_ in
            
        }
    }
    
    
}

extension AddIncidentVC:UITextFieldDelegate,UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        self.view.endEditing(true)
        return true
    }
}
