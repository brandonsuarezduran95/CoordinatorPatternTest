//
//  MainCoordinator.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

enum Event {
    case showSecondController
    case showThirdController
    case yieldToChildCoordinatorA
}

final class MainCoordinator: Coordinator {
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .showSecondController:
            var viewController: UIViewController & Coordinating = SecondViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
            
        case .showThirdController:
            var viewController:UIViewController & Coordinating = ThirdViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
            
        case .yieldToChildCoordinatorA:
            didYieldToChildCoordinatorA()
        }
    }
    
    func didYieldToChildCoordinatorA() {
        let childCoordinator = ChildCoordinatorA()
        childCoordinator.navigationController = navigationController
        childCoordinator.parentCoordinator = self
        children.append(childCoordinator)
        childCoordinator.start()
    }
    
    // MARK: Start Method
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        setupNavigationController()
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    fileprivate func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
                break
            }
        }
    }
}

