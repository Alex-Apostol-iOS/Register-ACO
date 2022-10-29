//
//  HabitStepDataManagerProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

protocol HabitStepDataManagerProtocol : AnyObject {
    func postPositiveHabit(habit: DtoPostiveHabit, completion: @escaping (Result<DtoPostiveHabit?, Error>) -> Void)
}
