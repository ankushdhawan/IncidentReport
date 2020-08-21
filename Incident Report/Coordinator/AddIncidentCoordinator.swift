//
//  AddIncidentVC.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 21/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit

class AddIncidentCoordinator: Coordinator,BackToFirstViewControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: BackToFirstViewControllerDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AddIncidentVC.instantiate()
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let viewModel = AddIncidentViewModel(gateway: gateway, controller: vc,validation:Validation())
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    
    }
    func navigateBackToLastPage() {
        self.delegate?.navigateBackToLastPage()
    }
    
}

