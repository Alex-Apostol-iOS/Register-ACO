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
        let user = RegisterACOUser(phone: viewModel.phone, password: viewModel.password, id: nil, surname: viewModel.surname, email: viewModel.email.lowercased(), name: viewModel.firstName, secondSurname: viewModel.secondSurname)
        interactor.postUser(user: user) { [weak self] result in
            switch result {
            case .success(let dtoUser):
                self?.dtoUser = dtoUser
                self?.coordinatorOutput(.goToHome)
            case .failure(let error):
                switch error {
                case .emailAlredyUsed:
                    self?.view?.showToast(message: "lng.error.email.alredy.used".localized, type: .error)
                default: break
                }
            }
        }
        
    }
}
