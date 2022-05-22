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
   
    
    func login(viewModel: LoginViewModel)  {
        view?.showLoader()
        Task { [weak self] in
            let user =  try await interactor.login(email: viewModel.email.lowercased(), password: viewModel.password)
            self?.view?.hideLoader()
        }
        
    }
}
