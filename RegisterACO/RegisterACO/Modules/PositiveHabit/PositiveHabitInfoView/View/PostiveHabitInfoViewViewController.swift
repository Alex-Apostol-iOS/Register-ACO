//
//  PostiveHabitInfoViewViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import UIKit

class PostiveHabitInfoViewViewController: RegisterAcoNavigationController {
    
    private let presenter: PostiveHabitInfoViewPresenterProtocol
        
    init (presenter: PostiveHabitInfoViewPresenterProtocol) {
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

extension PostiveHabitInfoViewViewController: PostiveHabitInfoViewViewProtocol{
    // TODO: Implement View Output Methods
}
