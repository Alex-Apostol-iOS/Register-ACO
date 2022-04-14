//
//  StarterInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation

class StarterInteractor: StarterInteractorProtocol {
    
    var dataManager: StarterDataManagerProtocol

    init(dataManager: StarterDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
