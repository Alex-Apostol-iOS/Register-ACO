//
//  StarterInteractorProtocol.swift
//  RegisterACO
//
//  Created by Alex Apostol on 14/4/22.
//  
//

import Foundation

protocol StarterInteractorProtocol : AnyObject {
    func getUser(id: String, completion: @escaping (Result<DtoUser, Error>) -> Void)
}
