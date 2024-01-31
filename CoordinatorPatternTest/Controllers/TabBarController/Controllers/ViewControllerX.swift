//
//  ViewControllerX.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ViewControllerX: UIViewController {
    var coordinator: ChildCoordinatorX?
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Controller X"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupButton()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("1B.-ViewControllerX Init\n")
    }
    
    deinit {
        print("1B.-ViewControllerX Deinit\n")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewControllerX {
    
    func setupButton() {
        view.addSubview(button)
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemYellow
        button.setTitle("Dismiss", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        let action = UIAction { [weak self] _ in
            self?.coordinator?.parentCoordinator?.eventOccurred(with: .dismissTabBarController)
            self?.tabBarController?.dismiss(animated: true)
        }
        button.addAction(action, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    
    }
    
}
