//
//  HabitStepViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import UIKit
import Combine

class HabitStepViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitStepPresenterProtocol
    private let viewModel: HabitStepModel
    private let verificationModel = BasicStepViewModel()
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var buttonSubscriber: AnyCancellable?
    
    private lazy var progressView: RegisterACOProgressView = {
        let view = RegisterACOProgressView(frame: .zero)
        return view
    }()
    
    
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
        label.text = viewModel.titleKey.localized
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.dark50)
        label.numberOfLines = 0
        label.text = viewModel.descriptionKey.localized
        return label
    }()
    
    private lazy var currentHabitTextView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: viewModel.firstTextAreaPlaceHolderKey.localized, shouldGrow: true)
        textArea.heightAnchor.constraint(equalToConstant: 96).isActive = true
        textArea.publisher
            .sink { text in
                self.verificationModel.firstTextField = text
            }.store(in: &cancellableSet)
        return textArea
    }()
    
    private lazy var newHabitTextView: RegisterACOTextArea = {
        let textArea = RegisterACOTextArea(frame: .zero)
        textArea.configure(placeHolder: viewModel.secondTextAreaPlaceHolderKey.localized, shouldGrow: true)
        textArea.heightAnchor.constraint(equalToConstant: 96).isActive = true
        
        textArea.publisher
            .sink { text in
                self.verificationModel.secondTextField = text
            }.store(in: &cancellableSet)
        return textArea
    }()
    
    private lazy var seeExampleButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: viewModel.secondaryButtonModel.titleKey.localized, action: didTapSeeExamples)
        button.isHidden = viewModel.secondaryButtonModel.shouldHideButton
        return button
    }()
    
    private lazy var continueButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: viewModel.mainButtonModel.titleKey.localized, action: didTapContinue)
        button.isHidden = viewModel.mainButtonModel.shouldHideButton
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            presenter.updateStep()
        }
    }
        
    init (presenter: HabitStepPresenterProtocol) {
        self.presenter = presenter
        self.viewModel = presenter.viewModel
        super.init(nibName: nil, bundle: nil)
        self.restorationIdentifier = "\(viewModel.navTtleKey)"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScrollViewLayout()
        setUpContentViewLayout()
        setUpProgressViewLayout()
        setUpMainStackViewLayout()
        progressView.setProgress(presenter.flowProgress, animated: false)
        configTitleAndCloseIcon(title: viewModel.navTtleKey.localized)
        super.rightBarButtonAction = didTapNavCloseIcon
        
        buttonSubscriber = verificationModel.validateFirstsSurnameAndPhone
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: continueButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    private func setUpMainStackViewLayout() {
        self.customContentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
       
        mainStackView.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 16).isActive = true
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
    
    private func setUpProgressViewLayout() {
        customContentView.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.topAnchor.constraint(equalTo: customContentView.topAnchor, constant: 16).isActive = true
        progressView.centerXAnchor.constraint(equalTo: customContentView.centerXAnchor).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc
    private func didTapSeeExamples() {
        presenter.didTapSeeExamples()
    }
    
    @objc
    private func didTapContinue() {
        presenter.didTapContinue(answer1: currentHabitTextView.text, answer2: newHabitTextView.text)
    }
    
    private func didTapNavCloseIcon() {
        presenter.didNavTapCloseIcon()
    }
    
    
}

extension HabitStepViewController: HabitStepViewProtocol {
    
    func goBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
