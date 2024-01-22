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

final class MainCoordinator: NSObject, Coordinator {
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
        navigationController?.delegate = self
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


extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
         
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a FourthViewController
        if let fourthViewController = fromViewController as? FourthViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(fourthViewController.coordinator)
        }
    }
}
