//
//  LoginPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

class LoginPresenter {
    private var interactor: LoginInteractorProtocol
    weak var view: LoginViewProtocol?
    private var coordinatorOutput: (LoginOutput) -> Void

    init(interactor: LoginInteractorProtocol, coordinnatorOutput: @escaping (LoginOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
}
