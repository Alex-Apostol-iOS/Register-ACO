//
//  LoginOutput.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

enum LoginOutput {
    case goToHome
    case goToLogout(logout: () -> Void)
}
