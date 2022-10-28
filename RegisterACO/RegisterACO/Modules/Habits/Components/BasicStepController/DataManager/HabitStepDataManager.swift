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
    
    func postPositiveHabit(habit: DtoPostiveHabit, completion: @escaping (Result<Bool, Error>) -> Void)  {
        let params = habit.dictionary
        
        serviceProxy.postItemNoResponse(url: Endpoint.habit.rawValue+Endpoint.postPositiveHabit.rawValue, parameters: params ?? [:], headers: buildLoginHeaders()) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

}
