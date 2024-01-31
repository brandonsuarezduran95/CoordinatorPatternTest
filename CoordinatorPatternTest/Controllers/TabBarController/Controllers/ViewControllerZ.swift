//
//  ViewControllerZ.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ViewControllerZ: UIViewController {
    
    var coordinator: ChildCoordinatorZ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        title = "Controller Z"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("3B.-ViewControllerZ Init\n")
    }
    
    deinit {
        print("3B.-ViewControllerZ Deinit\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
