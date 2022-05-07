//
//  Login_RegisterInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/4/22.
//  
//

import Foundation

class Login_RegisterInteractor: Login_RegisterInteractorProtocol {
    
    var dataManager: Login_RegisterDataManagerProtocol

    init(dataManager: Login_RegisterDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
