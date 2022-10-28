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
    
    func postPositiveHabit(completion: @escaping (Result<Bool, Error>) -> Void) {
        
        
        for step in stepData.stepData {
            print(step)
        }
        
        return
        
        guard let user = user?.user else {return}
        let dtoHabit = DtoPostiveHabit(
            user: user,
            name: "Habit",
            obviousAnswer: "voy a comer",
            attractiveAnswer: "attractiveAnswer",
            easyAnswer: "easyAnswer",
            satisfactionAnswer: "satisfactionAnswer",
            startDate: "startDate",
            habitAcumultationStrategy: DtoHabitAcumultationStrategy(actualHabit: "actual", newHabit: "new"),
            habitImplementationStrategy: nil )
        
        dataManager.postPositiveHabit(habit: dtoHabit) { result in
            switch result {
            case .success(_):
                completion(.success(true))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
