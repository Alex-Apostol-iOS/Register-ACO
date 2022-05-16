//
//  LoginViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import UIKit

class LoginViewController: UIViewController {
    
    private let presenter: LoginPresenterProtocol
        
    init (presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension LoginViewController: LoginViewProtocol{
    // TODO: Implement View Output Methods
}
