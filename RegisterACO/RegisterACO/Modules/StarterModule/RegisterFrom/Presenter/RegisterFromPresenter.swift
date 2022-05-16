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
        let user = DtoUser(email: viewModel.email, phone: viewModel.phone, surname: viewModel.surname, name: viewModel.firstName, secondSurname: viewModel.secondSurname, password: viewModel.password)
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
