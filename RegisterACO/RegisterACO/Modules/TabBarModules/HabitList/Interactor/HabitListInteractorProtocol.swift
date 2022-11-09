//
//  HabitListInteractorProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation

protocol HabitListInteractorProtocol : AnyObject {
    func getHabits(completion: @escaping (Result<[DtoPostiveHabit], Error>) -> Void)
    func deleteHabit(name: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
