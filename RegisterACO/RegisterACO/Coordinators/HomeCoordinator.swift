//
//  HomeCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 6/5/22.
//

import UIKit

class HomeCoordinator: Coordinator, GetLabel {
    
    enum HomeCoordinatorState {
        case goToUserData
        case willShowUserData
        case initial
        case willShowDefaultView
    }
    
    private var navigator: UINavigationController
    private var currentState: HomeCoordinatorState
    private var postiveHabitChildCoordinator: PositiveHabitCoordinator?
    
    init(with navigator: UINavigationController) {
        self.navigator = navigator
        currentState = .initial
        postiveHabitChildCoordinator = PositiveHabitCoordinator(on: navigator)
    }
    
    func start() {
        loop()
    }
    
    func loop() {
        currentState = next(state: currentState)
        switch currentState {
        case .willShowUserData:
            break
        case .willShowDefaultView:
            break
        default:
            fatalError("No navigation for \(currentState))")
        }
    }
    
    func manageHomeInternalNavigation(with output: HomeOutput) {
        switch output {
        case .goToPositiveHabitFlow:
            postiveHabitChildCoordinator?.start()
        case .goToNegativeHabitFlow:
            break
        }
    }
    
    func next(state: HomeCoordinatorState) -> HomeCoordinatorState {
        switch state {
        case .goToUserData:
            return .willShowUserData
        case .initial:
            return .willShowDefaultView
        default: return state
        }
    }
}
