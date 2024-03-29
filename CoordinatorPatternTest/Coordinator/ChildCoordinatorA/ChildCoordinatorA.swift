//
//  ChildCoordinatorA.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/21/24.
//

import UIKit

// For this coordinator I am going to create the actions by using functions

final class ChildCoordinatorA: Coordinator {
    
    var navigationController: UINavigationController?
    weak var parentCoordinator: MainCoordinator?
    
    var children: [Coordinator] = []
    
    init() {
        print("ChildCoordinatorA Init")
    }
    
    deinit {
        print("ChildCoordinatorA Deinit")
    }
    
    func start() {
        let viewController = FourthViewController()
        viewController.coordinator = self
        setupNavigationController()
        navigationController?.pushViewController(viewController, animated: true)     
    }
    
    fileprivate func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.setToolbarHidden(false, animated: false)
    }
    
}

extension ChildCoordinatorA {
    
    func pushFifthController(title: String, color: UIColor, dataSource: [Post]) {
        let controller = FifthViewController(color: color, mainTitle: title, dataSource: dataSource)
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
}
