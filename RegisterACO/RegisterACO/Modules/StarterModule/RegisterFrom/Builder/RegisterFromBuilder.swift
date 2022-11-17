//
//  RegisterFromBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation
import UIKit

class RegisterFromBuilder: Builder {
    
    var coordinatorOutput: (RegisterFromOutput) -> Void
    
    init(coordinatorOutput: @escaping(RegisterFromOutput) -> Void)  {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = RegisterFromDataManager()
        let interactor = RegisterFromInteractor(dataManager: dataManager)
        let presenter = RegisterFromPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = RegisterFromViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
