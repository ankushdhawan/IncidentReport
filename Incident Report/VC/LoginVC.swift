    //
    //  LoginVC.swift
    //  Incident Reporting
    //
    //  Created by Ankush Dhawan on 19/08/20.
    //  Copyright © 2020 Ankush Dhawan. All rights reserved.
    //
    
    import Foundation
    import UIKit
    
    class LoginVC: UIViewController,Storyboarded {
        //Mark:IBOUTLET OBJECTS
        @IBOutlet weak var loginTextField:UITextField!
        @IBOutlet weak var passwordTextField:UITextField!
        @IBOutlet weak var submitButton:UIButton!
        
        //Mark:OBJECTS
        var viewModel:LoginViewModelProtocol?
        var coordinator: MainCoordinatorProtocol?
        
        //Mark:Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.title = Constant.AppTitle
            
            // Do any additional setup after loading the view.
        }
        
        //Mark:IBACTION METHOD(S)
        
        /// Submit Action
        /// - Parameter sender: UIBUtton Instance
        @IBAction func submitButtonTapped(sender:UIButton)
        {
            if let message = viewModel?.checkFieldsValidation(userName: loginTextField.text!, password: passwordTextField.text!){
                self.presentAlertWithTitle(title: Constant.ErrorTitle, message: message, options: "OK") {_ in
                }
                return
            }
            self.coordinator?.navigateHomeScreen()
            
        }
        
        
    }
    
    extension LoginVC:UITextFieldDelegate
    {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
            self.view.endEditing(true)
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField == loginTextField
            {
                return viewModel?.checkStringAlphabeticOrNot(data: string) ?? true
            }
            return true
        }
        
    }
