//
//  HomeCoordinator.swift
//  Incident Report
//
//  Created by Ankush Dhawan on 21/08/20.
//  Copyright © 2020 Ankush Dhawan. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol {
    func navigateAddIncident()
}
protocol BackToFirstViewControllerDelegate: class {
    
    func navigateBackToLastPage()
    
}
class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var delegate: BackToFirstViewControllerDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeVC.instantiate()
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let gateway = IncidentGateWay(viewContext:context)
        let dataSource = HomeDataSource(models: [IncidentModel]())
        let viewModel = HomeViewModel(gateway: gateway, vc: vc, dataSource: dataSource)
         vc.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
}
extension HomeCoordinator:HomeCoordinatorProtocol
{
    func navigateAddIncident() {
        let addIncidentCoordinator = AddIncidentCoordinator(navigationController: navigationController)
        addIncidentCoordinator.delegate = self
         childCoordinators.append(addIncidentCoordinator)
         addIncidentCoordinator.start()
    }
    
    
}
extension HomeCoordinator:BackToFirstViewControllerDelegate
{
    func navigateBackToLastPage() {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
}
