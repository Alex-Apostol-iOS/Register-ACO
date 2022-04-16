//
//  StarterPresenter.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation

class StarterPresenter {
    var interactor: StarterInteractorProtocol
    weak var view: StarterViewProtocol?
    var coordinatorOutput: (StarterOutput) -> Void

    init(interactor: StarterInteractorProtocol, coordinnatorOutput: @escaping (StarterOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension StarterPresenter: StarterPresenterProtocol {
    func didTapUserButton(type: LoginRegisterUserType) {
        self.coordinatorOutput(.willShowLoginRegisterView(type: type))
    }
}
