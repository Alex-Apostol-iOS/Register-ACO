//
//  PositiveHabitCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 2/7/22.
//

import UIKit

class PositiveHabitCoordinator: Coordinator {
    
     enum PositiveHabitCoordinatorState {
        case initial
        case willShowPositiveHabitInfoView
        case didShowPositiveHabitInfoView
        case showPositiveHabitStep
    }
    
    private let navigator: UINavigationController
    private var state: PositiveHabitCoordinatorState
    
    
    init(on navigator: UINavigationController, with state: PositiveHabitCoordinatorState = .initial) {
        self.navigator = navigator
        self.state = state
    }
    
    func start() {
        state = .initial
        loop()
    }
    
    private func loop() {
        switch next(nextState: state) {
        case .willShowPositiveHabitInfoView:
            showPositiveHabitInfoView()
        case .showPositiveHabitStep:
            showPositiveHabitStep()
        case .initial, .didShowPositiveHabitInfoView:
            fatalError("no implementation for \(next(nextState: state)) on PositiveHabitCoordinator")
        }
    }
    
    private func next(nextState: PositiveHabitCoordinatorState) -> PositiveHabitCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowPositiveHabitInfoView
        case .didShowPositiveHabitInfoView:
            return .showPositiveHabitStep
        default: return nextState
        }
    }
    
    private func showPositiveHabitInfoView() {
        let vc = PostiveHabitInfoViewBuilder { [weak self] output in
            switch output {
            case .goToPositiveHabitStep:
                self?.state = .didShowPositiveHabitInfoView
                self?.loop()
            }
        }.build()
        navigator.pushViewController(vc, animated: true)
    }
    
    private func showPositiveHabitStep() {
        let vc = HabitStepBuilder { _ in
            
        }.build()
        navigator.pushViewController(vc, animated: true)
    }
    
}
