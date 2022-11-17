//
//  ProfileDataManager.swift
//  RegisterACO
//
//  Created by Alex Apostol on 27/5/22.
//  
//

import Foundation
import UIKit

class ProfileDataManager: ProfileDataManagerProtocol {
    @Cache(.userSession)
    var user: DtoUser?
    
    func logout() {
        KeychainHelper.sharedInstance.delete(service: .user_email, account: .registerACO)
        KeychainHelper.sharedInstance.delete(service: .user_password, account: .registerACO)
        let cleanNav = UINavigationController()
        let mainCoordinator = MainCoordinator(with: cleanNav, state: .initial)
        user = nil
        mainCoordinator.start()
        UIApplication.setRootView(cleanNav, options: UIApplication.loginAnimation)
    }
}
