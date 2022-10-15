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
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 2
        label.text = "lng.obviousHabit.title".localized
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.dark50)
        label.numberOfLines = 0
        label.text = "lng.obviousHabit.description".localized
        return label
    }()
    
    private lazy var currentHabitTextView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: "lng.obviousHabit.textArea.placeHolder".localized, shouldGrow: true)
        textArea.heightAnchor.constraint(equalToConstant: 96).isActive = true
        return textArea
    }()
    
    private lazy var newHabitTextView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: "lng.obviousHabit.textArea.NewHabit.placeHolder".localized, shouldGrow: true)
        textArea.heightAnchor.constraint(equalToConstant: 96).isActive = true
        return textArea
    }()
    
    private lazy var seeExampleButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: "lng.common.seeExamples".localized, action: didTapSeeExamples)
        return button
    }()
    
    private lazy var continueButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: "lng.common.continue".localized, action: didTapContinue)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [seeExampleButton, continueButton])
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let bottomSpaceView = FreeSpaceView()
        bottomSpaceView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, currentHabitTextView, newHabitTextView, FreeSpaceView(), buttonsStackView,  bottomSpaceView])
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
        configTitle(title: "lng.obviousHabit.nav.title".localized)
        
    }
    
    private func setUpMainStackViewLayout() {
        self.customContentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
       
        mainStackView.topAnchor.constraint(equalTo: self.customContentView.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.customContentView.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.customContentView.trailingAnchor, constant: -16).isActive = true
        let constraint = self.mainStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.customContentView.safeAreaLayoutGuide.bottomAnchor, constant: -40)
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
    
    @objc
    private func didTapSeeExamples() {
        
    }
    
    @objc
    private func didTapContinue() {
        
    }
    
    
}

extension HabitStepViewController: HabitStepViewProtocol{
    // TODO: Implement View Output Methods
}
