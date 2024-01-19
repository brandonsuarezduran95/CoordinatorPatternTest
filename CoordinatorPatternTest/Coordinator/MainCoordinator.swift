//
//  MainCoordinator.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var children: [Coordinator]? = nil
    
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
        }
    }
    
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
}
