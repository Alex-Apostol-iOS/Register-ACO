//
//  ProfileViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import UIKit

class ProfileViewController: RegisterAcoNavigationController {
    
    private let presenter: ProfilePresenterProtocol
    private var tableViewContent: [ProfileTableViewCellModel] = [] {
        didSet { 
            self.reloadTableViewData()
        }
    }
    
    private lazy var headerView: RegisterUserInfoHeader = {
       let view = RegisterUserInfoHeader()
        let userName = presenter.currentUser?.user?.name ?? ""
        let userSurname = presenter.currentUser?.user?.surname ?? ""
        view.configure(with: RegisterUserInfoHeaderModel(image: "", username: userName+" "+userSurname))
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = .none
        view.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.tableViewRegisterID)
        return view
    }()
        
    init (presenter: ProfilePresenterProtocol) {
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
        configTitle(title: presenter.getlabelForKey(key: "lng.common.profile"))
        setUpHederViewLayout()
        setUpTableViewLayout()
        presenter.viewDidLoad()
    }
    
    private func setUpHederViewLayout() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func reloadTableViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension ProfileViewController: ProfileViewProtocol{
    func layout(with tableViewContent:  [ProfileTableViewCellModel]) {
        self.tableViewContent = tableViewContent
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableViewContent[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.tableViewRegisterID, for: indexPath) as? ProfileTableViewCell else {return UITableViewCell()}
        
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableViewContent[indexPath.row]
        
        switch item.type {
        case .logout:
            presenter.didTapLogout()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
