//
//  LoginPresenterProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

protocol LoginPresenterProtocol: AnyObject, GetLabel {
    func login(viewModel: LoginViewModel)
    func getUser() -> DtoUser?
    func didTapLogout()
}
