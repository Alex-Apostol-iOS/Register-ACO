//
//  Endpoint.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Foundation

enum Endpoint: String {
    case mainUrl = "https://registeraco2.fly.dev"
    case user = "/user"
    case login = "/login"
    case habit = "/habit"
    case postPositiveHabit = "/positive"
    case getPositiveHabits = "/Allpositive"
    case deletePostiveHabits = "/deletePositiveHabit"
}
