//
//  StarterBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation
import UIKit

class StarterBuilder: Builder {
    
    private var coordinatorOutput: (StarterOutput) -> Void
    
    init(coordinatorOutput: @escaping (StarterOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = StarterDataManager()
        let interactor = StarterInteractor(dataManager: dataManager)
        let presenter = StarterPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = StarterViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
