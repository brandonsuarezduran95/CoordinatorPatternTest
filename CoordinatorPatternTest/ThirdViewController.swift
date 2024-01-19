//
//  ThirdViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/18/24.
//

import UIKit

class ThirdViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third View"
        view.backgroundColor = .systemGreen
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("ThirdViewController Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ThirdViewController DeInit")
    }
    
}

