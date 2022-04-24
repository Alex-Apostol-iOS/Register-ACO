//
//  RegisterFromInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

class RegisterFromInteractor: RegisterFromInteractorProtocol {
    
    var dataManager: RegisterFromDataManagerProtocol

    init(dataManager: RegisterFromDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
