//
//  Coordinator.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

enum Event {
    case showSecondController
    case showThirdController
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}


protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
