//
//  ChildCoordinatorY.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

enum CoordinatorYEvent {
    case test
}

final class ChildCoordinatorY: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator] = []
    var mainController: ViewControllerY? = ViewControllerY()
    
    weak var parentCoordinator: MainCoordinator?
    
    init() {
        print("2A.-ChildCoordinatorY Init\n")
    }
    
    deinit {
        print("2A.-ChildCoordinatorY Deinit\n")
    }
    
    func eventActivated(event: CoordinatorYEvent) {
        switch event {
        case .test:
            let controller = UIViewController()
            controller.view.backgroundColor = .systemPurple
            controller.title = "Test"
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func start() {
        
        guard let mainController = self.mainController else { return }
        mainController.coordinator = self
        mainController.tabBarItem = UITabBarItem(title: "Controller Y", image: .init(systemName: "triangle.fill"), selectedImage: nil)
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    func cleanUp() {
        mainController = nil
        navigationController = nil
    }
    
}
