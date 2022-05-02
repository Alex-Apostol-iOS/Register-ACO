//
//  RegisterFromInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

class RegisterFromInteractor: RegisterFromInteractorProtocol {
    
    var dataManager: RegisterFromDataManagerProtocol

    init(dataManager: RegisterFromDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func postUser(user: DtoUser, completion: @escaping (Result<DtoUser?, Error>) -> Void) {
        dataManager.postUser(user: user) { result in
            switch result {
            case .success(let dtoUser):
                completion(.success(dtoUser))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
