//
//  RegisterACOAllDone.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//

import UIKit

class RegisterACOAllDone: UIViewController {
    
    private lazy var allDoneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "success")
        view.contentMode = .scaleAspectFit
        view.heightAnchor.constraint(equalToConstant: 128).isActive = true
        view.widthAnchor.constraint(equalToConstant: 128).isActive = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.theme(id: .semiBold18)
        label.textColor = UIColor.theme(.dark100)
        label.numberOfLines = 2
        label.text = ""
        return label
    }()
    
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
    
    private lazy var secondaryButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .secondary, title: "lng.common.continue".localized, action: didTapSeeExamples)
        return button
    }()
    
    private lazy var mainButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: "lng.common.seeDetail".localized, action: didTapContinue)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondaryButton, mainButton])
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLayout()
        setUpAllDoneImageViewLayout()
        setUpButtonStackViewLayout()
        setUpCloseIconLayout()
        setUpTitleLayout()
    }
    
    private func setUpViewLayout() {
        view.backgroundColor = .white
    }
    
    private func setUpAllDoneImageViewLayout() {
        view.addSubview(allDoneImageView)
        allDoneImageView.translatesAutoresizingMaskIntoConstraints = false
        allDoneImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        allDoneImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setUpButtonStackViewLayout() {
        view.addSubview(buttonsStackView)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
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
    
    @objc
    private func didTapSeeExamples() {
        
    }
    
    @objc
    private func didTapContinue() {
        
    }
    
    @objc
    private func didTapCloseIcon() {
        dismiss(animated: true)
    }
}
