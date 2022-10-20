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
    
    init(modelImplementation: BasicStepControllerHelperImplementation, coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.modelImplementation = modelImplementation
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HabitStepDataManager()
        let interactor = HabitStepInteractor(dataManager: dataManager)
        let presenter = HabitStepPresenter(modelImplementation: modelImplementation, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HabitStepViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
