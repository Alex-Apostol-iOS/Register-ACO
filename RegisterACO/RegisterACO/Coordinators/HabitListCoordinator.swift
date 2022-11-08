//
//  HabitListCoordinator.swift
//  RegisterACO
//
//  Created by Apostol, Alexandru on 31/10/22.
//

import UIKit

class HabitListCoordinator: Coordinator {
    
    enum HabitListCoordinatorState {
        case inital
        case willShowHabitDetail(model: BasicDetailViewDataModel)
    }
    
    private var currentState: HabitListCoordinatorState
    private let navigator: UINavigationController
    
    
    init(on navigator: UINavigationController, with state: HabitListCoordinatorState) {
        self.navigator = navigator
        self.currentState = state
    }
    
    func start() {
        loop()
        
    }
    
   private  func loop() {
       switch next(nextState: currentState) {
       case .inital:
           break
       case .willShowHabitDetail(let model):
           showHabitDetail(for: model)
       }
   }
    
    func manageHabitListInternalNavigation(with output: HabitListOutput) {
        switch output {
        case .goToHabitDetail(let model):
            self.currentState = .willShowHabitDetail(model: model)
            self.loop()
        }
    }
    
    private func next(nextState: HabitListCoordinatorState) -> HabitListCoordinatorState {
        switch nextState {
        default: return nextState
        }
    }
    
    private func showHabitDetail(for model: BasicDetailViewDataModel) {
        let vc = BasicDetailViewController(dataModel: model)
        
        navigator.pushViewController(vc, animated: true)
    }
}

