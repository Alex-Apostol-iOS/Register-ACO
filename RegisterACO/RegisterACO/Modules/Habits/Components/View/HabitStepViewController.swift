//
//  HabitStepViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import UIKit

class HabitStepViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitStepPresenterProtocol
        
    init (presenter: HabitStepPresenterProtocol) {
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

extension HabitStepViewController: HabitStepViewProtocol{
    // TODO: Implement View Output Methods
}
