//
//  HomeBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import Foundation
import UIKit

class HomeBuilder: Builder {
    
    private var coordinatorOutput: (HomeOutput) -> Void
    
    init(coordinatorOutput:@escaping (HomeOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HomeDataManager()
        let interactor = HomeInteractor(dataManager: dataManager)
        let presenter = HomePresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HomeViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
