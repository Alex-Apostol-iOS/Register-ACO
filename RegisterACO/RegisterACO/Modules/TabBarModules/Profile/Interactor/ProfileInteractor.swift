//
//  ProfileInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation

class ProfileInteractor: ProfileInteractorProtocol {
    
    private var dataManager: ProfileDataManagerProtocol

    init(dataManager: ProfileDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
