//
//  RegisterFromInteractorProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

protocol RegisterFromInteractorProtocol : AnyObject {
    func postUser(user: RegisterACOUser, completion: @escaping (Result<DtoUser?, Error>) -> Void)
}
