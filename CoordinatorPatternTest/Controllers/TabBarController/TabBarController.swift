//
//  TabBarController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/24/24.
//

import UIKit
/*
 This UITabBarController owns its Child Coordinators,
 at the moment of it displaying its view, the controller initializes its coordinators,
 and passes the navigationControllers of the coordinators as the UITabBarController's viewControllers
 by passing the navigationControllers of each ChildCoordinator we ensure displaying a title, as well as navigation
 capabilities
 
*/
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
        title = "Test"
        
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
        
        guard let controllerX = childCoordinatorX.navigationController,
              let controllerY = childCoordinatorY.navigationController,
              let controllerZ = childCoordinatorZ.navigationController
        else { return }
        
        viewControllers = [ controllerX, controllerY, controllerZ ]
    }
    
    // The cleanup of every Coordinator will ensure De-init of every controller inside each coordinator, as well
    // as the navigationController
    func cleanUp() {
        childCoordinatorX.cleanUp()
        childCoordinatorY.cleanUp()
        childCoordinatorZ.cleanUp()
    }

}
