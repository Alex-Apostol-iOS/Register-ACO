//
//  RegisterFromDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

class RegisterFromDataManager: RegisterFromDataManagerProtocol {
    private let serviceProxy = AppManager.serviceProxy
    
    func postUser(user: DtoUser, completion: @escaping (Result<DtoUser?, Error>) -> Void) {
        let paramas = user.dictionary
        serviceProxy.postItem(url: Endpoint.user.rawValue, type: DtoUser.self, parameters: paramas ?? [:], headers: nil) { result in
            switch result {
            case .success(let dtoUser):
                completion(.success(dtoUser))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
