//
//  RegisterFromDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

class RegisterFromDataManager: RegisterFromDataManagerProtocol, CoreDataControllerProtcol {
    private let serviceProxy = AppManager.sharedInstace.serviceProxy
    
    func postUser(user: RegisterACOUser, completion: @escaping (Result<DtoUser?, Error>) -> Void) {
        let paramas = user.dictionary
        serviceProxy.postItem(url: Endpoint.user.rawValue, type: DtoUser.self, parameters: paramas ?? [:], headers: nil) { [weak self] result in
            switch result {
            case .success(let dtoUser):
                self?.putItem(CoreDateController.EntityKey.user.rawValue, common: dtoUser)
                completion(.success(dtoUser))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
