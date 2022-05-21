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
    func didTapSubmit(viewModel: RegisterFormViewModel) {
        let user = RegisterACOUser(phone: viewModel.phone, password: viewModel.email, id: nil, surname: viewModel.surname, email: viewModel.firstName, name: viewModel.secondSurname, secondSurname: viewModel.password)
        interactor.postUser(user: user) { result in
            switch result {
            case .success(let dtoUser):
                print(dtoUser)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
