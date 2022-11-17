//
//  PostiveHabitInfoViewInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import Foundation

class PostiveHabitInfoViewInteractor: PostiveHabitInfoViewInteractorProtocol {
    
    private var dataManager: PostiveHabitInfoViewDataManagerProtocol

    init(dataManager: PostiveHabitInfoViewDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
