//
//  ProfileCoordinator.swift
//  RegisterACO
//
//  Created by Alex Apostol on 28/5/22.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    enum ProfileCoordinatorState {
        case showAlert
        case willShowAlert
        case inital
        case willShowDefaultView

    }
    
    private var currentState: ProfileCoordinatorState
    private let navigator: UINavigationController
    
    init(on navigator: UINavigationController, with state: ProfileCoordinatorState = .inital) {
        self.navigator = navigator
        self.currentState = state
    }
    
    func start() {
        loop()
    }
    
    func manageProfileInternalNavigation(output: ProfileOutput)  {
        switch output {
        case .goToLogout:
            self.currentState = .showAlert
            self.loop()
        }
    }
    
    
    private func loop() {
        currentState = next(nextState: currentState)
        switch currentState {
        case .willShowAlert:
            showAlert()
        case .willShowDefaultView:
            break
        default:
            fatalError("no loop implemented For \(currentState) on ProfileCoordinator")
        }
    }
    
    private func next(nextState: ProfileCoordinatorState) -> ProfileCoordinatorState {
        switch nextState {
        case .showAlert:
            return .willShowAlert
        case .inital:
            return .willShowDefaultView
        default: 
            return nextState
        }
    }
    
    private func showAlert() {
        
        let alertViewModel = AlertViewModel(title: "lng.common.logout", subtitle: "lng.logout.subtitle", mainButtonTitle: "lng.common.yes", secondaryButttonTitle: "lng.common.no", mainButtonAction: {})
        let vc = AlertViewController(with: alertViewModel)
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .coverVertical
        navigator.present(vc, animated: true, completion: nil)
    }
}
