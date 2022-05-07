//
//  HomeViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import UIKit

class HomeViewController: RegisterAcoNavigationController {
    
    let presenter: HomePresenterProtocol
        
    init (presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}

extension HomeViewController: HomeViewProtocol{
    // TODO: Implement View Output Methods
}
