//
//  SecondViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        title = "Second View"
        addMoreButton()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("SecondViewController Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("SecondViewController DeInit")
    }
}

extension SecondViewController {
    
    func addMoreButton() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func didTapButton() {
        coordinator?.eventOccurred(with: .showThirdController)
    }
    
}

