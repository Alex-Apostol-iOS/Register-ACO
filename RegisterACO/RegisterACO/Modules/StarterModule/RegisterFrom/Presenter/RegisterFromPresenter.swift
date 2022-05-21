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
    @Cache(.userSession)
    var dtoUser: DtoUser?

    init(interactor: RegisterFromInteractorProtocol, coordinnatorOutput: @escaping (RegisterFromOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension RegisterFromPresenter: RegisterFromPresenterProtocol {
    func didTapSubmit(viewModel: RegisterFormViewModel) {
        let user = RegisterACOUser(phone: viewModel.phone, password: viewModel.password, id: nil, surname: viewModel.surname, email: viewModel.email, name: viewModel.secondSurname, secondSurname: viewModel.secondSurname)
        interactor.postUser(user: user) { result in
            switch result {
            case .success(let dtoUser):
                self.dtoUser = dtoUser
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
