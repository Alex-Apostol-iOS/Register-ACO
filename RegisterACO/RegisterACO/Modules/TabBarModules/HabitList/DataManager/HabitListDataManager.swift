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
    @Cache(.userSession)
    private var user: DtoUser?
    
    func getHabits(completion: @escaping (Result<[DtoPostiveHabit], Error>) -> Void) {
        let userID = user?.user?.id ?? ""
        serviceProxy.getItems(url: Endpoint.habit.rawValue+Endpoint.getPositiveHabits.rawValue, type: [DtoPostiveHabit].self, parameters: ["userID": userID], headers: HttpHeadersImplementaion.sharedInstance.buildBearerAuthHeader()) { result in
            switch result {
            case .success(let habitsList):
                completion(.success(habitsList))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func deleteHabit(name: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let userID = user?.user?.id ?? ""
        serviceProxy.deleteItemNoResponse(url: Endpoint.habit.rawValue+Endpoint.deletePostiveHabits.rawValue, parameters: ["habitName": name, "userID": userID], headers: HttpHeadersImplementaion.sharedInstance.buildBearerAuthHeader()) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
