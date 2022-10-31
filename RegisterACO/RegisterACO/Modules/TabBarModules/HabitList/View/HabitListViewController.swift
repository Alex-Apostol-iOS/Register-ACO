//
//  HabitListViewController.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import UIKit

class HabitListViewController: RegisterAcoNavigationController {
    
    private let presenter: HabitListPresenterProtocol
        
    init (presenter: HabitListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
    
}

extension HabitListViewController: HabitListViewProtocol{
    // TODO: Implement View Output Methods
}
