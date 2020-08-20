//
//  MainCoordinator.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 19/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit
protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func homeScreen()
    func start()
}
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginVC.instantiate()
        vc.coordinator = self
        vc.viewModel = LoginViewModel()
        navigationController.pushViewController(vc, animated: false)
    }
    func homeScreen() {
        let vc = HomeVC.instantiate()
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let dataSource = HomeDataSource(models: [IncidentModel]())
        let viewModel = HomeViewModel(gateway: gateway, vc: vc, dataSource: dataSource)
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    func addIncidentScreen() {
        let vc = AddIncidentVC.instantiate()
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let viewModel = AddIncidentViewModel(gateway: gateway, controller: vc,validation:Validation())
        vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
