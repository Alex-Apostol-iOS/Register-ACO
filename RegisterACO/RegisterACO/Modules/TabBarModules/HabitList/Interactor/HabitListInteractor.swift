//
//  HabitListInteractor.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation

class HabitListInteractor: HabitListInteractorProtocol {
    
    private var dataManager: HabitListDataManagerProtocol

    init(dataManager: HabitListDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
