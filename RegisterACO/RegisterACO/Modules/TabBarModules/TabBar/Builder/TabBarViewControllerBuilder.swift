//
//  TabBarViewControllerBuilder.swift
//  RegisterACO
//
//  Created by Alex Apostol on 22/5/22.
//  
//

import Foundation
import UIKit

class TabBarViewControllerBuilder: Builder {
    
    private var coordinatorOutput: (TabBarViewControllerOutput) -> Void
    
    init(coordinnatorOutput: @escaping (TabBarViewControllerOutput) -> Void) {
        self.coordinatorOutput = coordinnatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = TabBarViewControllerDataManager()
        let interactor = TabBarViewControllerInteractor(dataManager: dataManager)
        let presenter = TabBarViewControllerPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = TabBarViewControllerViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
