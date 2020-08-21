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
    func start()
}

protocol MainCoordinatorProtocol {
    func navigateHomeScreen()
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
    
}
extension MainCoordinator:MainCoordinatorProtocol
{
    func navigateHomeScreen() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
    
    
}

