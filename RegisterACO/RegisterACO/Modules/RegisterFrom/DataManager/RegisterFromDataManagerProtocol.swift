//
//  RegisterFromDataManagerProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 24/4/22.
//  
//

import Foundation

protocol RegisterFromDataManagerProtocol : AnyObject {
    func postUser(user: DtoUser, completion: @escaping (Result<DtoUser?, Error>) -> Void)
}
