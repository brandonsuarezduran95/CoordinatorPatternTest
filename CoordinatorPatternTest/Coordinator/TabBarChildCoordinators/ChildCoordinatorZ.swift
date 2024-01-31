//
//  ChildCoordinatorZ.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

final class ChildCoordinatorZ: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator] = []
    var mainController: ViewControllerZ? = ViewControllerZ()
    
    weak var parentCoordinator: MainCoordinator?
    
    init() {
        print("3A.-ChildCoordinatorZ Init\n")
    }
    
    deinit {
        print("3A.-ChildCoordinatorZ Deinit\n")
    }
    
    func start() {
        guard let mainController = self.mainController else { return }
        mainController.coordinator = self
        mainController.tabBarItem = UITabBarItem(title: "Controller Z", image: .init(systemName: "circle.fill"), selectedImage: nil)
        navigationController?.pushViewController(mainController, animated: true)
    }
    
    func cleanUp() {
        mainController = nil
        navigationController = nil
    }
    
}
