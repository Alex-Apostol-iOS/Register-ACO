//
//  HabitStepInteractor.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

class HabitStepInteractor: HabitStepInteractorProtocol {
    
    private var dataManager: HabitStepDataManagerProtocol

    init(dataManager: HabitStepDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
