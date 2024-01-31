//
//  MainCoordinator.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

enum Event {
    case pushSecondController
    case pushThirdController
    case yieldToChildCoordinatorA
    case presentTabController
    case dismissTabBarController
}

final class MainCoordinator: NSObject, Coordinator {
    var barController: TabBarController?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .pushSecondController:
            var viewController: UIViewController & Coordinating = SecondViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
            
        case .pushThirdController:
            var viewController:UIViewController & Coordinating = ThirdViewController()
            viewController.coordinator = self
            navigationController?.pushViewController(viewController, animated: true)
            
        case .yieldToChildCoordinatorA:
            didYieldToChildCoordinatorA()
            
        case .presentTabController:
            barController = TabBarController()
            barController?.coordinator = self
            barController?.modalPresentationStyle = .fullScreen
            
            guard let barController = self.barController else { return }
            navigationController?.present(barController, animated: true)
            
        case .dismissTabBarController:
            
            barController?.coordinator = nil
            barController = nil
            // 1.- remove the coordinators from the children Array
            
            children.removeAll { coordinator in
                if coordinator is ChildCoordinatorX || coordinator is ChildCoordinatorY || coordinator is ChildCoordinatorZ {
                    return true
                }
                return false
            }
            
            print("The children are: ",children)
            
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
