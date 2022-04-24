//
//  RegisterFromViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import UIKit
import SwiftUI

class RegisterFromViewController: RegisterAcoNavigationController {
    
    private let presenter: RegisterFromPresenterProtocol
    @StateObject private var viewModel = RegisterFormViewModel()
    
    private lazy var passwordTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonPassword"), isSecureText: true)
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var nameTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonName"))
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var surnameTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonSurname"))
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var secondSurnameTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonSecondSurname"))
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var emailTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonEmail"))
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var phoneTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonPhone"))
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
    }()
    
    private lazy var passwordConfirmTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonPasswordConfirm"), isSecureText: true)
        textField.heightAnchor.constraint(equalToConstant: 56).isActive = true
        return textField
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
    
    private lazy var submitButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.commonSubmit"), action: submitForm)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = FreeSpaceView()
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
       let stackView = UIStackView(arrangedSubviews: [nameTextField, surnameTextField, secondSurnameTextField, emailTextField, phoneTextField,passwordTextField, passwordConfirmTextField, FreeSpaceView(), submitButton, view])
        stackView.distribution  = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.backgroundColor = .white
        return stackView
    }()
        
    init (presenter: RegisterFromPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle(title: presenter.getlabelForKey(key: "lng.registerFormNavTitle"))
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
    private func submitForm() {
        
    }
    
    @objc private func nameTextFieldValidation() {
       
    }
    
}

extension RegisterFromViewController: RegisterFromViewProtocol{
    // TODO: Implement View Output Methods
}
