//
//  DtoUser.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/5/22.
//

import Foundation

struct DtoUser: Codable, Hashable {
    var id: String?
    let email, phone, surname: String?
    let name, secondSurname: String?
}
