//
//  HabitListBuilder.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//  
//

import Foundation
import UIKit

class HabitListBuilder: Builder {
    
    private var coordinatorOutput: (HabitListOutput) -> Void
    
    init(coordinnatorOutput: @escaping (HabitListOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = HabitListDataManager()
        let interactor = HabitListInteractor(dataManager: dataManager)
        let presenter = HabitListPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = HabitListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
