//
//  SecondViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/17/24.
//

import UIKit

/// ViewModel is fetching the data for the controller - MVVM

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    let viewModel = SecondControllerViewModel()
    
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
        view.backgroundColor = .systemYellow
        title = "Second View"
        viewModel.callback = { [unowned self] data in
            self.dataSource = data
        }
        addMoreButton()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
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

extension SecondViewController {
    
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

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
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
