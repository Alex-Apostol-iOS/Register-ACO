//
//  HabitStepInteractor.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

class HabitStepInteractor: HabitStepInteractorProtocol {
    
    private var dataManager: HabitStepDataManagerProtocol
    @Cache(.userSession)
    private var user: DtoUser?
    private let stepData: BasicStepViewControllerStepDTOContainer


    init(stepData: BasicStepViewControllerStepDTOContainer, dataManager: HabitStepDataManagerProtocol) {
        self.stepData = stepData
        self.dataManager = dataManager
    }
    
    func postPositiveHabit(lastAnswer:BasicStepViewControllerStepDTO, completion: @escaping (Result<DtoPostiveHabit?, Error>) -> Void) {
        
        let firstStepData = stepData.stepData[0]
        let secondStepData = stepData.stepData[1]
        stepData.stepData.append(lastAnswer)
        let thirdStepData = lastAnswer
       
        
        guard let user = user?.user else {return}
        let dtoHabit = DtoPostiveHabit(
            user: user,
            name: firstStepData.answer1,
            obviousAnswer: thirdStepData.answer1,
            attractiveAnswer: secondStepData.answer1,
            easyAnswer: thirdStepData.answer2,
            satisfactionAnswer: secondStepData.answer2,
            startDate: Date().debugDescription,
            habitAcumultationStrategy: DtoHabitAcumultationStrategy(actualHabit: firstStepData.answer1, newHabit: firstStepData.answer2),
            habitImplementationStrategy: nil )
        
        dataManager.postPositiveHabit(habit: dtoHabit) { result in
            switch result {
            case .success(let habit):
                completion(.success(habit))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
