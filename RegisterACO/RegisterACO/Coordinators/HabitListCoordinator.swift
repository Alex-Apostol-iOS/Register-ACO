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
        case willShowHabitDetail
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
       case .willShowHabitDetail:
           break
       }
   }
    
    func manageHabitListInternalNavigation(with output: HabitListOutput) {
       
    }
    
    private func next(nextState: HabitListCoordinatorState) -> HabitListCoordinatorState {
        switch nextState {
        default: return nextState
        }
    }
}

