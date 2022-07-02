//
//  PostiveHabitInfoViewBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//  
//

import Foundation
import UIKit

class PostiveHabitInfoViewBuilder: Builder {
    
    private var coordinatorOutput: (PostiveHabitInfoViewOutput) -> Void
    
    init(coordinnatorOutput: @escaping (PostiveHabitInfoViewOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = PostiveHabitInfoViewDataManager()
        let interactor = PostiveHabitInfoViewInteractor(dataManager: dataManager)
        let presenter = PostiveHabitInfoViewPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = PostiveHabitInfoViewViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
