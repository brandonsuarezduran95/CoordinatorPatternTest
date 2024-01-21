//
//  ViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordinator: MainCoordinator?
    
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Home"
        setupButton()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("ViewController Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ViewController DeInit")
    }
}

extension ViewController {
    func setupButton() {
        view.addSubview(button)
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemYellow
        button.setTitle("Perform", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func didTapButton() {
        coordinator?.eventOccurred(with: .showSecondController)
    }
}
