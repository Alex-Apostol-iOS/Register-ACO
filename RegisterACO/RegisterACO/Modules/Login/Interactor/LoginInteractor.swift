//
//  LoginInteractor.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    private var dataManager: LoginDataManagerProtocol

    init(dataManager: LoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    
    func login(email: String, password: String) async throws -> DtoUser {
       let  user = try await dataManager.login(email: email, password: password)
        KeychainHelper.sharedInstance.delete(service: .user_password, account: .registerACO)
        KeychainHelper.sharedInstance.delete(service: .user_email, account: .registerACO)
        
        let password = user.user?.password ?? ""
        let data = Data(password.utf8)
       
        KeychainHelper.sharedInstance.save(data, service: .user_password, account: .registerACO)
        
        let email = user.user?.email ?? ""
        let emailData = Data(email.utf8)
        KeychainHelper.sharedInstance.save(emailData, service: .user_email, account: .registerACO)
        
        return user
    }
}
