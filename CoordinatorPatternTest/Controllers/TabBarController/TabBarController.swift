//
//  TabBarController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/24/24.
//

import UIKit

class TabBarController: UITabBarController, Coordinating {
    var coordinator: MainCoordinator?
    
    let childCoordinatorX = ChildCoordinatorX()
    let childCoordinatorY = ChildCoordinatorY()
    let childCoordinatorZ = ChildCoordinatorZ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
    }
    
    init () {
        super.init(nibName: nil, bundle: nil)
        print("TabBarController Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("TabBarController Deinit")
        cleanUp()
    }
    
    func setupTabBar() {
        view.backgroundColor = .systemPink
        tabBar.backgroundColor = .white
        
        childCoordinatorX.parentCoordinator = coordinator
        childCoordinatorY.parentCoordinator = coordinator
        childCoordinatorZ.parentCoordinator = coordinator
        
        childCoordinatorX.navigationController = UINavigationController()
        childCoordinatorY.navigationController = UINavigationController()
        childCoordinatorZ.navigationController = UINavigationController()
        
        childCoordinatorX.start()
        childCoordinatorY.start()
        childCoordinatorZ.start()
        
        coordinator?.children = [childCoordinatorX, childCoordinatorY, childCoordinatorZ ]
        
        guard let controllerX = childCoordinatorX.mainController,
              let controllerY = childCoordinatorY.mainController,
              let controllerZ = childCoordinatorZ.mainController
        else { return }
        
        viewControllers = [ controllerX, controllerY, controllerZ]
    }
    
    func cleanUp() {
        childCoordinatorX.cleanUp()
        childCoordinatorY.cleanUp()
        childCoordinatorZ.cleanUp()
    }

}
