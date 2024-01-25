//
//  ChildCoordinatorY.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ChildCoordinatorY: Coordinator {
    var navigationController: UINavigationController?
    
    var children: [Coordinator] = []
    
    init() {
        print("ChildCoordinatorY Init")
    }
    
    deinit {
        print("ChildCoordinatorY Deinit")
    }
    
    func start() {
        
    }
    
}
