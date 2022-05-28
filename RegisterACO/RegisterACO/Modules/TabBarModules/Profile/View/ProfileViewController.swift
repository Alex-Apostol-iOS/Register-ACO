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
    }
    
    private func reloadTableViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
}

extension ProfileViewController: ProfileViewProtocol{
    // TODO: Implement View Output Methods
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
