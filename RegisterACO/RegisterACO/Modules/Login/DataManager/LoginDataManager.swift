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
    
    @available(iOS 15.0.0, *)
    func login() async throws {
       async let userLogin = serviceProxy.getItemAsyncAwait(url: "", type: DtoUser.self, parameters: [:])
    }
}
