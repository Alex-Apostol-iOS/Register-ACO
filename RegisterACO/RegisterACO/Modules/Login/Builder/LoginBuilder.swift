//
//  LoginBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation
import UIKit

class LoginBuilder: Builder {
    
    private var coordinatorOutput: (LoginOutput) -> Void
    
    init(coordinnatorOutput: @escaping (LoginOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = LoginDataManager()
        let interactor = LoginInteractor(dataManager: dataManager)
        let presenter = LoginPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = LoginViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
