//
//  LoginDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

class LoginDataManager: LoginDataManagerProtocol, HTTPHeadersHelper {
    let serviceProxy = AppManager.serviceProxy
    
    
    func login(email: String, password: String) async throws -> DtoUser {
        
        async let userLogin = serviceProxy.postItemAsyncAwait(url: Endpoint.user.rawValue+Endpoint.login.rawValue, type: DtoUser.self, parameters: [:], headers: buildLoginHeadersWithParams(email: email, password: password))
        
        return try await userLogin
    }
}
