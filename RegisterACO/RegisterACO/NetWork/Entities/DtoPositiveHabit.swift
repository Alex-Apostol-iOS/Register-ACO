//
//  DtoPositiveHabit.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 28/10/22.
//

import Foundation

struct DtoPostiveHabit: Codable {
    let user: RegisterACOUser
    let name,  obviousAnswer, attractiveAnswer, easyAnswer, satisfactionAnswer, startDate: String
    let habitAcumultationStrategy: DtoHabitAcumultationStrategy?
    let habitImplementationStrategy: HabitImplementationStrategy?
}

struct DtoHabitAcumultationStrategy: Codable {
    let actualHabit, newHabit: String
}

struct HabitImplementationStrategy: Codable {
    let conduct: String
    let hour: String
    let place: String
}
