//
//  Endpoint.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Foundation

enum Endpoint: String {
    case mainUrl = "http://127.0.0.1:8080"
    case user = "/user"
    case login = "/login"
    case habit = "/habit"
    case postPositiveHabit = "/positive"
    case getPositiveHabits = "/Allpositive"
    case deletePostiveHabits = "/deletePositiveHabit"
}
