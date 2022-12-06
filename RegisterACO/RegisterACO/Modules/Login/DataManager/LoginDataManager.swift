//
//  LoginDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation
import UIKit

class LoginDataManager: LoginDataManagerProtocol, HTTPHeadersHelper, CoreDataControllerProtcol {
    private let serviceProxy = AppManager.sharedInstace.serviceProxy
    @Cache(.userSession)
    var user: DtoUser?
    
    
    func login(email: String, password: String) async throws -> DtoUser {
        
        async let userLogin = serviceProxy.postItemAsyncAwait(url: Endpoint.user.rawValue+Endpoint.login.rawValue, type: DtoUser.self, parameters: [:], headers: buildLoginHeadersWithParams(email: email, password: password))
        
        return try await userLogin
    }
    
    func logout() {
        KeychainHelper.sharedInstance.delete(service: .user_email, account: .registerACO)
        KeychainHelper.sharedInstance.delete(service: .user_password, account: .registerACO)
        let cleanNav = UINavigationController()
        let mainCoordinator = MainCoordinator(with: cleanNav, state: .initial)
        user = nil
        delete(entityName: CoreDateController.EntityKey.user.rawValue)
        mainCoordinator.start()
        UIApplication.setRootView(cleanNav, options: UIApplication.loginAnimation)
    }
}
