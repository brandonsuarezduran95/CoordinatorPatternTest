//
//  ViewControllerY.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ViewControllerY: UIViewController {
    var coordinator: ChildCoordinatorY?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Controller Y"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("2B.-ViewControllerY Init\n")
    }
    
    deinit {
        print("2B.-ViewControllerY Deinit\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
