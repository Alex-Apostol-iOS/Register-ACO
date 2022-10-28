//
//  HabitStepInteractorProtocol.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

protocol HabitStepInteractorProtocol : AnyObject {
    func postPositiveHabit(completion: @escaping (Result<Bool, Error>) -> Void) 
}
