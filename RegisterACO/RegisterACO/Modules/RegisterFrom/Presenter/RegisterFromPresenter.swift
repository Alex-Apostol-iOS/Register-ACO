//
//  RegisterFromPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

class RegisterFromPresenter {
    var interactor: RegisterFromInteractorProtocol
    weak var view: RegisterFromViewProtocol?
    var coordinatorOutput: (RegisterFromOutput) -> Void

    init(interactor: RegisterFromInteractorProtocol, coordinnatorOutput: @escaping (RegisterFromOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension RegisterFromPresenter: RegisterFromPresenterProtocol {
}
