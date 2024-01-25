//
//  TabBarController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/24/24.
//

import UIKit

class TabBarController: UITabBarController, Coordinating {
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        // Do any additional setup after loading the view.
    }
    

}
