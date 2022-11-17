//
//  HabitStepBuilder.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 12/10/22.
//  
//

import Foundation
import UIKit

class HabitStepBuilder: Builder {
    
    private var coordinatorOutput: (HabitStepOutput) -> Void
    private let modelImplementation: BasicStepControllerHelperImplementation
    private let stepData: BasicStepViewControllerStepDTOContainer

    init(stepData: BasicStepViewControllerStepDTOContainer, modelImplementation: BasicStepControllerHelperImplementation, coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.stepData = stepData
        self.modelImplementation = modelImplementation
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HabitStepDataManager()
        let interactor = HabitStepInteractor(stepData: stepData, dataManager: dataManager)
        let presenter = HabitStepPresenter(modelImplementation: modelImplementation, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HabitStepViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
