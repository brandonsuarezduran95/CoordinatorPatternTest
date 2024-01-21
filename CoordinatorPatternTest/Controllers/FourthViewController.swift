//
//  FourthViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/21/24.
//

import UIKit

class FourthViewController: UIViewController {
    var coordinator: ChildCoordinatorA?
    
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupButton()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishCoordinating()
    }
}


extension FourthViewController {
    func setupController() {
        view.backgroundColor = .systemOrange
        title = "Fourth View"
    }
    
    func setupButton() {
        view.addSubview(button)
        
        button.setTitle("More", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)

        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.showsMenuAsPrimaryAction = true
        button.menu = createMenu()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func createMenu() -> UIMenu {
        let actionA = UIAction(title: "Action A") { [unowned self] _ in
            coordinator?.showFifthController(title: "A", color: .systemPurple)
        }
        
        let actionB = UIAction(title: "Action B") { [unowned self] _ in
            coordinator?.showFifthController(title: "B", color: .systemMint)
        }
        
        let actionC = UIAction(title: "Action C") { [unowned self] _ in
            coordinator?.showFifthController(title: "C", color: .systemYellow)
        }
        
        let menu = UIMenu(title: "More", children: [actionA, actionB, actionC])
        
        return menu
    }
}
