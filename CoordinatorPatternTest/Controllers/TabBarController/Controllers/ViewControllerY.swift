//
//  ViewControllerY.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/25/24.
//

import UIKit

class ViewControllerY: UIViewController {
    var coordinator: ChildCoordinatorY?
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Controller Y"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.white]
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
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

extension ViewControllerY {
    
    func setupButton() {
        view.addSubview(button)
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemYellow
        button.setTitle("Perform", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        
        let action = UIAction { [weak self] _ in
            self?.coordinator?.eventActivated(event: .test)
            self?.tabBarController?.tabBar.isHidden = true
            
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
