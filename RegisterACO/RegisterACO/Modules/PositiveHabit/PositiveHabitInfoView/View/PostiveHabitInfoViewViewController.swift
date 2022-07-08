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
    
    private lazy var mainStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [whatIsaHabitVerticalStackView, howHabitsAffectYourLifeVerticalStackView, FreeSpaceView()])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 24
        stackView.axis = .vertical
        return stackView
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
        setUpStackViewLayout()
    }
    
    private func setUpStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc
    private func didChangeWhatIsAHabitSwitchValue() {
        whatIsaHabitTextView.isHidden = !whatIsAHabitSwichButton.isOn
    }
    
    @objc
    private func howHabitsAffectYourLifeSwichValue() {
        howHabitsAfectYourLifeContentLabel.isHidden = !howHabitsAffectYourLifeSwitchButton.isOn
    }
    
}

extension PostiveHabitInfoViewViewController: PostiveHabitInfoViewViewProtocol{
    // TODO: Implement View Output Methods
}
