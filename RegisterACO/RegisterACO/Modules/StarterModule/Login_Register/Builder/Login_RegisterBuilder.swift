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
    private var coordinatorOutput: (Login_RegisterOutput) -> Void
    private let type: LoginRegisterUserType
    
    init(type: LoginRegisterUserType, coordinatorOutput: @escaping (Login_RegisterOutput) -> Void) {
        self.type = type
        self.coordinatorOutput = coordinatorOutput
    }
    func build() -> UIViewController {
        let dataManager = Login_RegisterDataManager()
        let interactor = Login_RegisterInteractor(dataManager: dataManager)
        let presenter = Login_RegisterPresenter(type: type, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = Login_RegisterViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}

enum LoginRegisterUserType {
    case seller
    case distribuitor
}
