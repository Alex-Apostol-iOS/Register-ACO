//
//  Login_RegisterViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import UIKit

class Login_RegisterViewController: UIViewController {
    
    let presenter: Login_RegisterPresenterProtocol
        
    init (presenter: Login_RegisterPresenterProtocol) {
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

extension Login_RegisterViewController: Login_RegisterViewProtocol{
    // TODO: Implement View Output Methods
}
