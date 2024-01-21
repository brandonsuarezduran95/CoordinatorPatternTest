//
//  ThirdViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/18/24.
//

import UIKit

/// This Controller is in charge of fetching its own data. - MVC

class ThirdViewController: UIViewController, Coordinating {
    var coordinator: MainCoordinator?
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    var dataSource: [User] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third View"
        view.backgroundColor = .systemGreen
        setupTableView()
        fetchData()
        addMoreButton()
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
    
    func fetchData() {
        NetworkManager().fetchUsersData { respond in
            switch respond {
            case .success(let data):
                DispatchQueue.global(qos: .default).async { [unowned self] in
                    self.dataSource = data
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func addMoreButton() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func didTapButton() {
        coordinator?.eventOccurred(with: .yieldToChildCoordinatorA)
    }

    
}


extension ThirdViewController {
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
    }
    
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = dataSource[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = data.name
        cell.selectionStyle = .none
        return cell
    }
}
