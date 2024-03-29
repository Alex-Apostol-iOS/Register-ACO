//
//  DtoUser.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/5/22.
//

import Foundation

// MARK: - DtoUser
struct DtoUser: Codable {
    let token: String?
    var user: RegisterACOUser?
}

// MARK: - User
struct RegisterACOUser: Codable, Hashable {
    var phone, password, id, surname: String?
    let email, name, secondSurname: String?
}

