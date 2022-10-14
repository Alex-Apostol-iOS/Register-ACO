//
//  HabitStepPresenter.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation

class HabitStepPresenter {
    private var interactor: HabitStepInteractorProtocol
    weak var view: HabitStepViewProtocol?
    private var coordinatorOutput: (HabitStepOutput) -> Void

    init(interactor: HabitStepInteractorProtocol, coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HabitStepPresenter: HabitStepPresenterProtocol {
    
}
