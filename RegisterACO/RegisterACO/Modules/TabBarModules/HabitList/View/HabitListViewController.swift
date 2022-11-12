//
//  HabitListViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import UIKit

class HabitListViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitListPresenterProtocol
    private var content = [DtoPostiveHabit]()
    
    private lazy var tableView: ContentSizedTableView = {
        let view = ContentSizedTableView(frame: .zero)
        view.register(HabitListViewTableViewCell.self, forCellReuseIdentifier: HabitListViewTableViewCell.identifier)
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var noDataView: RegisterACONoDataView = {
        let view = RegisterACONoDataView(frame: .zero)
        view.configure(text: "lng.noHabit.infoLabel.text".localized)
        return view
    }()
        
    init (presenter: HabitListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
    private func setupTableVliewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0 ).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0 ).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16).isActive = true
    }
    
    private func setUpNoDataViewLayout() {
        view.addSubview(noDataView)
        noDataView.translatesAutoresizingMaskIntoConstraints = false
        noDataView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        noDataView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func controlContentLayout() {
        if content.isEmpty {
            tableView.removeFromSuperview()
            noDataView.removeFromSuperview()
            setUpNoDataViewLayout()
        } else {
            noDataView.removeFromSuperview()
            tableView.removeFromSuperview()
            setupTableVliewLayout()
        }
    }
    
}

extension HabitListViewController: HabitListViewProtocol{
    func layout(with content: [DtoPostiveHabit]) {
        self.content = content
        tableView.reloadData()
        controlContentLayout()
    }
}

extension HabitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = content[indexPath.row]
       guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitListViewTableViewCell.identifier) as? HabitListViewTableViewCell else {return UITableViewCell()}
        cell.configure(with: presenter.buildListItemModel(from: item))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = content[indexPath.row]
        presenter.didTapCell(item: item)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
