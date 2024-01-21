//
//  FifthViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/21/24.
//

import UIKit

class FifthViewController: UIViewController {
    let color: UIColor
    let mainTitle: String
    var coordinator: ChildCoordinatorA?
    
    init(color: UIColor, mainTitle: String) {
        self.mainTitle = mainTitle
        self.color = color
        super.init(nibName: nil, bundle: nil)
        print("FifthController Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("FifthController Deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        didSetController()
    }
    
}

extension FifthViewController {
    func didSetController() {
        title = mainTitle
        view.backgroundColor = color
    }
}
