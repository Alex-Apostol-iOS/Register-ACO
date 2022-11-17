//
//  LoginInteractorProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 16/5/22.
//  
//

import Foundation

protocol LoginInteractorProtocol : AnyObject {
    
    func login(email: String, password: String) async throws -> DtoUser
}
