//
//  LoginViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import UIKit
import Combine

class LoginViewController: RegisterAcoNavigationController {
    
    private let presenter: LoginPresenterProtocol
    private let model = LoginViewModel()
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var buttonSubscriber: AnyCancellable?
    
    private lazy var passwordTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonPassword"), type: .password, fieldText: presenter.getlabelForKey(key: "lng.common.passwordFieldText"))
       
        textField.publisher
            .sink { text in
                self.model.password = text
            }.store(in: &cancellableSet)
        return textField
    }()
    
    private lazy var emailTextField: RegisterACOTextField = {
        let textField = RegisterACOTextField(frame: .zero)
        textField.configure(placeHolder: presenter.getlabelForKey(key: "lng.commonEmail"), type: .email)
       
        textField.publisher
            .sink { text in
                self.model.email = text
            }.store(in: &cancellableSet)
        return textField
    }()
    
    private lazy var submitButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.commonSubmit"), action: submitForm)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, FreeSpaceView(), submitButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
        
    init (presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle(title: presenter.getlabelForKey(key: "lng.login"))
        setUpMainStackViewLayout()
        view.backgroundColor = .white
        buttonSubscriber = model.validateCredentials
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: submitButton)
    }
    
    private func setUpMainStackViewLayout() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
    }
    
    @objc
    private func submitForm()  {
         presenter.login(viewModel: model)
    }
    
}

extension LoginViewController: LoginViewProtocol{
    // TODO: Implement View Output Methods
}
