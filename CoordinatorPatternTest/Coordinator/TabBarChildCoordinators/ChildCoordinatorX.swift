//
//  ChildCoordinatorX.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ChildCoordinatorX: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator] = []
    
    init() {
        print("ChildCoordinatorX Init")
    }
    
    deinit {
        print("ChildCoordinatorX Deinit")
    }
    
    func start() {
        
    }
    
}
