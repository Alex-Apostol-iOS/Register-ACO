//
//  HabitStepViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import UIKit

class HabitStepViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitStepPresenterProtocol
    
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.backgroundColor = UIColor.white
        return scroll
    }()
    
    private lazy var customContentView: UIView = {
       let content = UIView()
        content.backgroundColor = UIColor.white
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()

    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold24)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 2
        label.text = "TEST TILE"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark75)
        label.numberOfLines = 0
        label.text = "Tests description, ests description ests description ests description ests description ests description ests description ests description ests description ests description"
        return label
    }()
    
    private lazy var textView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: "test placeHolder", shouldGrow: true)
        textArea.heightAnchor.constraint(greaterThanOrEqualToConstant: 96).isActive = true
        return textArea
    }()
    
    private lazy var mainStackView: UIStackView = {
        let bottomSpaceView = FreeSpaceView()
        bottomSpaceView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, textView, FreeSpaceView(), bottomSpaceView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
        
    init (presenter: HabitStepPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollViewLayout()
        setUpContentViewLayout()
        setUpMainStackViewLayout()
        
    }
    
    private func setUpMainStackViewLayout() {
        self.customContentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
       
        mainStackView.topAnchor.constraint(equalTo: self.customContentView.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.customContentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.customContentView.trailingAnchor, constant: -16).isActive = true
        let constraint = self.mainStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.customContentView.bottomAnchor, constant: 0)
        constraint.priority = UILayoutPriority(250)
        constraint.isActive = true
    }
    
    private func setUpScrollViewLayout() {
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo:  self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo:  self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:  self.view.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo:  self.view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo:  self.view.centerXAnchor).isActive = true
    }
    
    private func setUpContentViewLayout() {
        scrollView.addSubview(customContentView)
        customContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        customContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        customContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        customContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80).isActive = true
        customContentView.widthAnchor.constraint(equalTo:    self.view.widthAnchor).isActive = true
        customContentView.heightAnchor.constraint(greaterThanOrEqualTo:  self.view.heightAnchor).isActive = true
    }
    
}

extension HabitStepViewController: HabitStepViewProtocol{
    // TODO: Implement View Output Methods
}
