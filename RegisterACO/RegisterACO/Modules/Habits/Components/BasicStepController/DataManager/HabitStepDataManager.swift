//
//  HabitStepDataManager.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

class HabitStepDataManager: HabitStepDataManagerProtocol, HTTPHeadersHelper {
     let serviceProxy = AppManager.serviceProxy
    
    func postPositiveHabit(habit: DtoPostiveHabit, completion: @escaping (Result<DtoPostiveHabit?, Error>) -> Void)  {
        let params = habit.dictionary
        
        serviceProxy.postItem(url: Endpoint.habit.rawValue+Endpoint.postPositiveHabit.rawValue, type: DtoPostiveHabit.self, parameters: params ?? [:], headers: buildHeaders()) { result in
            switch result {
            case .success(let habit):
                completion(.success(habit))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

}
