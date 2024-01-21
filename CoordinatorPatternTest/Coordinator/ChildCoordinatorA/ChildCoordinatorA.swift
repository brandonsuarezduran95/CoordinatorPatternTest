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
    
    func didFinishCoordinating() {
        parentCoordinator?.childDidFinish(self)
    }
    
    fileprivate func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension ChildCoordinatorA {
    
    func showFifthController(title: String, color: UIColor) {
        let controller = FifthViewController(color: color, mainTitle: title)
        controller.coordinator = self
        navigationController?.pushViewController(controller, animated: true)
    }
}
