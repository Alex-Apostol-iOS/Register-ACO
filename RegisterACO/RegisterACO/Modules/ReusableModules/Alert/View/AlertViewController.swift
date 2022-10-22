//
//  AlertViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class AlertViewController: UIViewController, GetLabel {
    
    private let model: AlertViewModel
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .bold18)
        label.textColor = UIColor.theme(.dark75)
        label.text = model.title.localized
        label.textAlignment = .center
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.baseLight20)
        label.text = model.subtitle.localized
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondaryButton, primaryButton])
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var primaryButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: model.mainButtonTitle.localized, action: didTapPrimaryButton)
        return button
    }()
    
    private lazy var secondaryButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: model.secondaryButttonTitle.localized, action: didTapSecondatButton)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let topSpaceView = UIView(frame: .zero)
        topSpaceView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        let bottomSpaceView = UIView(frame: .zero)
        bottomSpaceView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let stackView = UIStackView(arrangedSubviews: [topSpaceView, contentStackView, bottomSpaceView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, buttonsStackView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    init(with model: AlertViewModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
        view.backgroundColor = UIColor.theme(.backGrounOpaqueOveraly)
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        mainStackView.layer.cornerRadius = 24
    }
    
    @objc
    private func didTapPrimaryButton() {
        model.mainButtonAction()
    }
    
    @objc
    private func didTapSecondatButton() {
        if let secondaryButtonActtion = model.secondaryButtonAction {
            secondaryButtonActtion()
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
