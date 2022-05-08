//
//  StarterInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation

class StarterInteractor: StarterInteractorProtocol {
    
    var dataManager: StarterDataManagerProtocol

    init(dataManager: StarterDataManagerProtocol) {
        self.dataManager = dataManager
    }
    func getUser(id: String, completion: @escaping (Result<DtoUser, Error>) -> Void) {
        dataManager.getUser(id: id) { result in
            switch result {
            case .success(let dtoUser):
                completion(.success(dtoUser))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
