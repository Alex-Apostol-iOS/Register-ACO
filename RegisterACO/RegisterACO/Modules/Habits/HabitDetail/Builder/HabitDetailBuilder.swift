//
//  HabitDetailBuilder.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 29/10/22.
//  
//

import Foundation
import UIKit

class HabitDetailBuilder: Builder {
    
    private var coordinatorOutput: (HabitDetailOutput) -> Void
    
    init(coordinnatorOutput: @escaping (HabitDetailOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HabitDetailDataManager()
        let interactor = HabitDetailInteractor(dataManager: dataManager)
        let presenter = HabitDetailPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HabitDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
