//
//  HabitDetailInteractor.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//  
//

import Foundation

class HabitDetailInteractor: HabitDetailInteractorProtocol {
    
    private var dataManager: HabitDetailDataManagerProtocol

    init(dataManager: HabitDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
