//
//  Login_RegisterViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import UIKit

class Login_RegisterViewController: RegisterAcoNavigationController {
    
    let presenter: Login_RegisterPresenterProtocol
    
    private lazy var registerButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.register"), action: didTapLoginButton)
        return button
    }()
    
    private lazy var loginButton: RegisterACOButton = {
        let button = RegisterACOButton(frame: .zero)
        button.config(buttonStyle: .primary, title: presenter.getlabelForKey(key: "lng.login"), action: didTapLoginButton)
        return button
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerButton, loginButton])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
        
    init (presenter: Login_RegisterPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainStackViewLayout()
    }
    
    private func setUpMainStackViewLayout()  {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func didTapLoginButton() {
        
    }
    
    private func didTapRegisterButton() {
        
    }
    
}

extension Login_RegisterViewController: Login_RegisterViewProtocol{
    // TODO: Implement View Output Methods
}
