//
//  LoginInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    private var dataManager: LoginDataManagerProtocol

    init(dataManager: LoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
