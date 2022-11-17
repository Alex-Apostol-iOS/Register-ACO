//
//  HomeInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 7/5/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    
    var dataManager: HomeDataManagerProtocol

    init(dataManager: HomeDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
