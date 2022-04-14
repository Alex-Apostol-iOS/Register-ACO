//
//  StarterViewController.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import UIKit

class StarterViewController: UIViewController {
    
    let presenter: StarterPresenterProtocol
        
    init (presenter: StarterPresenterProtocol) {
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

extension StarterViewController: StarterViewProtocol{
    // TODO: Implement View Output Methods
}
