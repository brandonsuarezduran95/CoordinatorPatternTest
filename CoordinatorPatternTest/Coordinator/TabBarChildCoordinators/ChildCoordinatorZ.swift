//
//  ChildCoordinatorZ.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ChildCoordinatorZ: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator] = []
    
    init() {
        print("ChildCoordinatorZ Init")
    }
    
    deinit {
        print("ChildCoordinatorZ Deinit")
    }
    
    func start() {
        
    }
    
}
