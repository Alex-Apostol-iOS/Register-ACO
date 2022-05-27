//
//  ProfileViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import UIKit

class ProfileViewController: RegisterAcoNavigationController {
    
    private let presenter: ProfilePresenterProtocol
        
    init (presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle(title: presenter.getlabelForKey(key: "lng.common.profile"))
    }
    
}

extension ProfileViewController: ProfileViewProtocol{
    // TODO: Implement View Output Methods
}
