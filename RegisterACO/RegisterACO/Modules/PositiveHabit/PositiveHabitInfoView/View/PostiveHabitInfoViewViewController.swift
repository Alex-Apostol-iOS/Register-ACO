//
//  PostiveHabitInfoViewViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import UIKit

class PostiveHabitInfoViewViewController: RegisterAcoNavigationController {
    
    private let presenter: PostiveHabitInfoViewPresenterProtocol
    
    private lazy var whatIsAHabitSwichButton: RegisterACOSwitchButton = {
        let switchButton = RegisterACOSwitchButton(frame: .zero)
        switchButton.addTarget(self, action: #selector(didChangeWhatIsAHabitSwitchValue), for: .valueChanged)
        return switchButton
    }()
    
    private lazy var whatIsaHabitStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [whatIsaHabitTextLabel,  FreeSpaceView(), whatIsAHabitSwichButton])
         stackView.distribution = .fill
         stackView.alignment = .center
         stackView.spacing = 0
         stackView.axis = .horizontal
         return stackView
    }()
    
    private lazy var whatIsaHabitVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [whatIsaHabitStackView, whatIsaHabitTextView])
         stackView.distribution = .fill
         stackView.alignment = .fill
         stackView.spacing = 0
         stackView.axis = .vertical
         return stackView
    }()
    
    private lazy var whatIsaHabitTextLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold16)
        label.textColor = UIColor.theme(.baseLight20)
        label.text = presenter.getlabelForKey(key: "lng.whatIsAHabit.label.text")
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var  whatIsaHabitTextView: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark75)
        label.text = presenter.getlabelForKey(key: "lng.whatIsAHabit.textView.text")
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private lazy var howHabitsAffectyourLifeTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold16)
        label.textColor = UIColor.theme(.baseLight20)
        label.text = presenter.getlabelForKey(key: "lng.howHabitsAffectYourLife.label.text")
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var howHabitsAffectYourLifeSwitchButton: RegisterACOSwitchButton = {
        let switchButton = RegisterACOSwitchButton(frame: .zero)
        switchButton.addTarget(self, action: #selector(howHabitsAffectYourLifeSwichValue), for: .valueChanged)
        return switchButton
    }()
    
    private lazy var howHabitsAffectYourLifeHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [howHabitsAffectyourLifeTitleLabel,  FreeSpaceView(), howHabitsAffectYourLifeSwitchButton])
         stackView.distribution = .fill
         stackView.alignment = .center
         stackView.spacing = 0
         stackView.axis = .horizontal
         return stackView
    }()
    
    private lazy var  howHabitsAfectYourLifeContentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark75)
        label.text = presenter.getlabelForKey(key: "lng.howHabitsAffectYourLife.content.label.text")
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private lazy var howHabitsAffectYourLifeVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [howHabitsAffectYourLifeHorizontalStackView, howHabitsAfectYourLifeContentLabel])
         stackView.distribution = .fill
         stackView.alignment = .fill
         stackView.spacing = 0
         stackView.axis = .vertical
         return stackView
    }()
    
    
    private lazy var howHabitsWorkTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold16)
        label.textColor = UIColor.theme(.baseLight20)
        label.text = presenter.getlabelForKey(key: "lng.habit.how.habit.work")
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var howHabitsWorkSwitchButton: RegisterACOSwitchButton = {
        let switchButton = RegisterACOSwitchButton(frame: .zero)
        switchButton.addTarget(self, action: #selector(howHabitWorkSwitchValue), for: .valueChanged)
        return switchButton
    }()
    
    private lazy var howHabitsWorkHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [howHabitsWorkTitleLabel,  FreeSpaceView(), howHabitsWorkSwitchButton])
         stackView.distribution = .fill
         stackView.alignment = .center
         stackView.spacing = 0
         stackView.axis = .horizontal
         return stackView
    }()
    
    private lazy var howHabitsWorkContentLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium16)
        label.textColor = UIColor.theme(.dark75)
        label.text = presenter.getlabelForKey(key: "lng.howHabitsWork.content.label.text")
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private lazy var howHabitsWorkVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [howHabitsWorkHorizontalStackView, howHabitsWorkContentLabel])
         stackView.distribution = .fill
         stackView.alignment = .fill
         stackView.spacing = 0
         stackView.axis = .vertical
         return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let  botttomSpaceView = FreeSpaceView()
        botttomSpaceView.heightAnchor.constraint(equalToConstant: 40).isActive = true
       let stackView = UIStackView(arrangedSubviews: [whatIsaHabitVerticalStackView, howHabitsAffectYourLifeVerticalStackView, howHabitsWorkVerticalStackView, FreeSpaceView(), continueButton, botttomSpaceView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 24
        stackView.axis = .vertical
        return stackView
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
    
    private lazy var continueButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.common.continue"), action: didTapContinue)
        return button
    }()
        
    init (presenter: PostiveHabitInfoViewPresenterProtocol) {
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
        let constraint = self.mainStackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.customContentView.bottomAnchor, constant: -80)
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
    private func didChangeWhatIsAHabitSwitchValue() {
        whatIsaHabitTextView.isHidden = !whatIsAHabitSwichButton.isOn
    }
    
    @objc
    private func howHabitsAffectYourLifeSwichValue() {
        howHabitsAfectYourLifeContentLabel.isHidden = !howHabitsAffectYourLifeSwitchButton.isOn
    }
    
    @objc
    private func howHabitWorkSwitchValue() {
        howHabitsWorkContentLabel.isHidden = !howHabitsWorkSwitchButton.isOn
    }
    
    @objc
    private func didTapContinue() {
        
    }
    
}

extension PostiveHabitInfoViewViewController: PostiveHabitInfoViewViewProtocol{
    // TODO: Implement View Output Methods
}
