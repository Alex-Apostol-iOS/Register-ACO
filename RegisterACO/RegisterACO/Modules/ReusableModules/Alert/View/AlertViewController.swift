//
//  AlertViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class AlertViewController: UIViewController, GetLabel {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .bold18)
        label.textColor = UIColor.theme(.dark75)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .medium14)
        label.textColor = UIColor.theme(.baseLight20)
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
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var primaryButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: getlabelForKey(key: "lng.common.yes"), action: didTapPrimaryButton)
        return button
    }()
    
    private lazy var secondaryButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: getlabelForKey(key: "lng.common.no"), action: didTapSecondatButton)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelsStackView, buttonsStackView])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    @objc
    private func didTapPrimaryButton() {
        
    }
    
    @objc
    private func didTapSecondatButton() {
        
    }
}
