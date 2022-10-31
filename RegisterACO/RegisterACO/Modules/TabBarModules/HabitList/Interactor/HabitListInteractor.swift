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
    
    func getHabits(completion: @escaping (Result<[DtoPostiveHabit], Error>) -> Void) {
        dataManager.getHabits { result in
            switch result {
            case .success(let habitsList):
                completion(.success(habitsList))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
