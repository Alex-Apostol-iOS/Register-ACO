//
//  RegisterAcoErrors.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 8/12/22.
//

import Foundation

enum RegisterAcoErrors: Error {
    case emailAlredyUsed
    case wrongPassword
    case unknownd(message: String)
}
