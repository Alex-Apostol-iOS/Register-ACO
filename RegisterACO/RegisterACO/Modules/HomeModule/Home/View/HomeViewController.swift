//
//  HomeViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import UIKit

class HomeViewController: RegisterAcoNavigationController {
    
    private let presenter: HomePresenterProtocol
    private var tableViewDifableDataSurce: UITableViewDiffableDataSource<HomeListSection, DtoUser>!
    private var content: [DtoUser] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.showsVerticalScrollIndicator = false
        view.register(HomeListUserTableViewCell.self, forCellReuseIdentifier: HomeListUserTableViewCell.tableViewRegisterID)
        return view
    }()
    
    init (presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        setUpTableViewDataSource()
        setUpTableViewLayout()
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func setUpTableViewDataSource() {
        tableViewDifableDataSurce = UITableViewDiffableDataSource<HomeListSection, DtoUser>(tableView: tableView, cellProvider: {
            tableView, indexPath, model -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListUserTableViewCell.tableViewRegisterID, for: indexPath) as?  HomeListUserTableViewCell else { return UITableViewCell()}
            return cell
        })
    }
    
}

extension HomeViewController: HomeViewProtocol{
    func layout(with users: [DtoUser]) {
        var snapshot = NSDiffableDataSourceSnapshot<HomeListSection, DtoUser>()
        snapshot.appendSections([.users])
        snapshot.appendItems(users, toSection: .users)
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
