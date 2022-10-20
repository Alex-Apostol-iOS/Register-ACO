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
    private let modelImplementation: BasicStepControllerHelperImplementation
    
    init(modelImplementation: BasicStepControllerHelperImplementation, interactor: HabitStepInteractorProtocol, coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.modelImplementation = modelImplementation
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension HabitStepPresenter: HabitStepPresenterProtocol {
    
    var viewModel: HabitStepModel {return modelImplementation.createHabitModel(for: BasicStepControllerModelType.allCases[modelImplementation.currentStep])}
    
    func didTapSeeExamples() {
        coordinatorOutput(.goToDetailViewController)
    }
    
    func didTapContinue() {
        coordinatorOutput(.goToNextStep)
    }
    
    func updateStep() {
        if modelImplementation.currentStep != 0 {
            modelImplementation.currentStep -= 1
        }
    }
}
