//
//  HabitStepInteractorProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

protocol HabitStepInteractorProtocol : AnyObject {
    func postPositiveHabit(lastAnswer:BasicStepViewControllerStepDTO, completion: @escaping (Result<DtoPostiveHabit?, Error>) -> Void)
}
