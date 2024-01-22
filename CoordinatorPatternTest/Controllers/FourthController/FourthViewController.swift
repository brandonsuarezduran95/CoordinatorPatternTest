//
//  FourthViewController.swift
//  CoordinatorPatternTest
//
//  Created by Brandon Suarez on 1/21/24.
//

import UIKit

class FourthViewController: UIViewController {
    var coordinator: ChildCoordinatorA?
    let viewModel = FourthControllerViewModel()
    var dataSource: [Post] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.table.reloadData()
            }
        }
    }
    
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("FourthViewController Init")
    }
    
    deinit {
        print("FourthViewController Deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupTableView()
        viewModel.callback = { [unowned self] data in
            self.dataSource = data
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupToolbar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
}


extension FourthViewController {
    func setupController() {
        view.backgroundColor = .systemOrange
        title = "Fourth View"
    }
    
    func setupToolbar() {
        let actionButton = UIBarButtonItem(systemItem: .action, menu: createMenu())
        
        navigationController?.setToolbarHidden(false, animated: false)
        navigationController?.toolbar.items = [.flexibleSpace(), actionButton]

//        navigationController?.toolbar.backgroundColor = .white
    }
    
    func createMenu() -> UIMenu {
        let actionA = UIAction(title: "Action A") { [unowned self] _ in
            coordinator?.showFifthController(title: "FifthView - A", color: .systemPurple)
        }
        
        let actionB = UIAction(title: "Action B") { [unowned self] _ in
            coordinator?.showFifthController(title: "FifthView - B", color: .systemMint)
        }
        
        let actionC = UIAction(title: "Action C") { [unowned self] _ in
            coordinator?.showFifthController(title: "FifthView - C", color: .systemYellow)
        }
        
        let menu = UIMenu(title: "More", children: [actionA, actionB, actionC])
        
        return menu
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

extension FourthViewController: UITableViewDelegate, UITableViewDataSource {
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
