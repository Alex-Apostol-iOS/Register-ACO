//
//  TabBarViewControllerViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import UIKit

class TabBarViewControllerViewController: UITabBarController {
    
    private let presenter: TabBarViewControllerPresenterProtocol
        
    init (presenter: TabBarViewControllerPresenterProtocol) {
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

extension TabBarViewControllerViewController: TabBarViewControllerViewProtocol{
    // TODO: Implement View Output Methods
}
