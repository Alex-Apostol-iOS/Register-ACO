//
//  StarterDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation

class StarterDataManager: StarterDataManagerProtocol {
    private let serviceProxy = AppManager.serviceProxy
    
    func getUser(id: String, completion: @escaping (Result<DtoUser, Error>) -> Void) {
        serviceProxy.getItem(url: Endpoint.user.rawValue, type: DtoUser.self, parameters: ["id":id], headers: nil) { result in
            switch result {
            case .success(let dtoUser):
                completion(.success(dtoUser))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
