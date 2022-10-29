//
//  HabitDetailViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//  
//

import UIKit

class HabitDetailViewController: UIViewController {
    
    private let presenter: HabitDetailPresenterProtocol
        
    init (presenter: HabitDetailPresenterProtocol) {
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

extension HabitDetailViewController: HabitDetailViewProtocol{
    // TODO: Implement View Output Methods
}
