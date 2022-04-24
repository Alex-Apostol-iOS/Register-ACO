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
    }
    
}

extension RegisterFromViewController: RegisterFromViewProtocol{
    // TODO: Implement View Output Methods
}
