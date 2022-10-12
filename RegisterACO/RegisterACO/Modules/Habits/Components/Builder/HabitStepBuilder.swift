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
    
    init(coordinnatorOutput: @escaping (HabitStepOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HabitStepDataManager()
        let interactor = HabitStepInteractor(dataManager: dataManager)
        let presenter = HabitStepPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HabitStepViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
