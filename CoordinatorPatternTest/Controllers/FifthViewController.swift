//
//  FifthViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/21/24.
//

import UIKit

// This controller gets its dataSource through dependency injection

class FifthViewController: UIViewController {
    let color: UIColor
    let mainTitle: String
    var coordinator: ChildCoordinatorA?
    let dataSource: [Post]
    
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    init(color: UIColor, mainTitle: String, dataSource: [Post]) {
        self.mainTitle = mainTitle
        self.color = color
        self.dataSource = dataSource
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
        setController()
        setupTableView()
    }
    
}

extension FifthViewController {
    func setController() {
        title = mainTitle
        view.backgroundColor = color
    }
    
    func setupTableView() {
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
}

extension FifthViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = dataSource[indexPath.row].title
        return cell
    }
    
    
}
