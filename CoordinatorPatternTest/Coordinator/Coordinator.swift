//
//  Coordinator.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator] { get set }
    
    func start()
}


protocol Coordinating {
    var coordinator: MainCoordinator? { get set }
}
