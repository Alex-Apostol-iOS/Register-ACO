//
//  Login_RegisterBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import Foundation
import UIKit

class Login_RegisterBuilder: Builder {
    var coordinatorOutput: (Login_RegisterOutput) -> Void
    
    init(coordinatorOutput: @escaping (Login_RegisterOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    func build() -> UIViewController {
        let dataManager = Login_RegisterDataManager()
        let interactor = Login_RegisterInteractor(dataManager: dataManager)
        let presenter = Login_RegisterPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = Login_RegisterViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
