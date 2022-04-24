//
//  RegisterFromViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import UIKit

class RegisterFromViewController: UIViewController {
    
    let presenter: RegisterFromPresenterProtocol
        
    init (presenter: RegisterFromPresenterProtocol) {
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

extension RegisterFromViewController: RegisterFromViewProtocol{
    // TODO: Implement View Output Methods
}
