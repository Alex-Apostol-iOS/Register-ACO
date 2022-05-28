//
//  ProfileCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    enum ProfileCoordinatorState {
        case inital
        case showAlert
        case willShowProfile
        case willShowAlert
    }
    
    private var currentState: ProfileCoordinatorState
    private let navigator: UINavigationController
    
    init(on navigator: UINavigationController, with state: ProfileCoordinatorState ) {
        self.navigator = navigator
        self.currentState = state
    }
    
    func start() {
        currentState = .inital
        loop()
    }
    
    
    private func loop() {
        currentState = next(nextState: currentState)
        switch currentState {
        case .willShowProfile:
            showProfileModule()
        case .willShowAlert:
            break
        default:
            fatalError("no loop implemented For \(currentState) on ProfileCoordinator")
        }
    }
    
    private func next(nextState: ProfileCoordinatorState) -> ProfileCoordinatorState {
        switch nextState {
        case .inital:
            return .willShowProfile
        case .showAlert:
            return .willShowAlert
        case .willShowAlert, .willShowProfile:
            return nextState
        }
    }
    
    private func showProfileModule() {
        let vc = ProfileBuilder { _ in
            
        }.build()
        navigator.present(vc, animated: true, completion: nil)
    }
}
