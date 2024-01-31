//
//  ChildCoordinatorX.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

final class ChildCoordinatorX: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator] = []
    var mainController: ViewControllerX? = ViewControllerX()
    
    weak var parentCoordinator: MainCoordinator?
    
    init() {
        print("1A.-ChildCoordinatorX Init\n")
    }
    
    deinit {
        print("1A.-ChildCoordinatorX Deinit\n")
    }
    
    func start() {
        mainController?.coordinator = self
        mainController?.tabBarItem = UITabBarItem(title: "Controller X", image: .init(systemName: "square.fill"),selectedImage: nil)
        navigationController?.pushViewController(mainController!, animated: true)
    }
    
    func cleanUp() {
        mainController = nil
        navigationController = nil
    }
    
}
