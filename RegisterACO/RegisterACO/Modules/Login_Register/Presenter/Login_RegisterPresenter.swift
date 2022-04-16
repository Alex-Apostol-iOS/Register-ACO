//
//  Login_RegisterPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import Foundation

class Login_RegisterPresenter {
    var interactor: Login_RegisterInteractorProtocol
    weak var view: Login_RegisterViewProtocol?
    var coordinatorOutput: (Login_RegisterOutput) -> Void

    init(interactor: Login_RegisterInteractorProtocol, coordinnatorOutput: @escaping (Login_RegisterOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension Login_RegisterPresenter: Login_RegisterPresenterProtocol {
    
}
