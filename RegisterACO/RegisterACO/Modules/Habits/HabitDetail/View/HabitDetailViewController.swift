//
//  HabitDetailViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//  
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    private let presenter: HabitDetailPresenterProtocol
    private var content: HabitDetailSection = HabitDetailSection(sectionData: [])
    
  
    private lazy var closeIcon: UIButton = {
        let imageView = UIButton(frame: .zero)
        imageView.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate), for: .normal)
        imageView.tintColor = UIColor.theme(.baseLight20)
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.addTarget(self, action: #selector(didTapCloseIcon), for: .touchUpInside)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 0
        label.text = "lng.habitResume.title".localized
        return label
    }()
    
    private lazy var tableView: ContentSizedTableView = {
        let view = ContentSizedTableView(frame: .zero)
        view.showsVerticalScrollIndicator = false
        view.allowsSelection = false
        view.separatorStyle = .none
        view.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        return view
    }()
    
    init (presenter: HabitDetailPresenterProtocol) {
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
        tableView.dataSource = self
        setUpCloseIconLayout()
        setUpTitleLayout()
        setUpTableViewLayout()
        presenter.viewDidLoad()
    }
    
    private func setUpCloseIconLayout() {
        view.addSubview(closeIcon)
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        closeIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        closeIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
    }
    
    private func setUpTitleLayout() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: closeIcon.bottomAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc
    private func didTapCloseIcon() {
        dismiss(animated: true)
    }
    
}

extension HabitDetailViewController: HabitDetailViewProtocol{
    func layout(with content: HabitDetailSection) {
        self.content = content
        tableView.reloadData()
    }
}

extension HabitDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return content.sectionData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.sectionData[section].rows.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var contentConfiguration = UITableViewCell().defaultContentConfiguration()
        contentConfiguration.textProperties.font =  UIFont.theme(id: .medium14)
        contentConfiguration.textProperties.color =  UIColor.theme(.dark50)
        contentConfiguration.textProperties.alignment = .natural
        contentConfiguration.textProperties.numberOfLines = 0
        contentConfiguration.text = content.sectionData[indexPath.section].rows[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 0
        label.text = content.sectionData[section].sectionTitle
        label.backgroundColor = UIColor.theme(.baseLight20)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
    
}
