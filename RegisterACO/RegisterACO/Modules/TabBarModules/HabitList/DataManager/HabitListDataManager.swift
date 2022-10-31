//
//  HabitListDataManager.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation

class HabitListDataManager: HabitListDataManagerProtocol {
    private let serviceProxy = AppManager.serviceProxy
    
    func getHabits(completion: @escaping (Result<[DtoPostiveHabit], Error>) -> Void) {
        serviceProxy.getItems(url: Endpoint.habit.rawValue+Endpoint.getPositiveHabits.rawValue, type: [DtoPostiveHabit].self, parameters: [:]) { result in
            switch result {
            case .success(let habitsList):
                completion(.success(habitsList))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
