//
//  HabitStepOutput.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

enum HabitStepOutput {
    case goToDetailViewController
    case goToNextStep(stepData: BasicStepViewControllerStepDTO)
    case goToAllDone(habit: DtoPostiveHabit)
}
