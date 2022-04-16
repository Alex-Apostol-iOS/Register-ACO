//
//  MainCoordinator.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import UIKit

class MainCoordinator: Coordinator {

    private var navigator: UINavigationController
    
    enum MainCoordinatorState {
        case initial
        case willShowLogin
        case didShowLogin(type: LoginRegisterUserType)
        case willShowLoginRegisterFlow(type: LoginRegisterUserType)
    }
    
    private var state: MainCoordinatorState
    
    init(with navigator: UINavigationController, state: MainCoordinatorState) {
        self.navigator = navigator
        self.state = state
    }
    
    func start() {
        self.loop()
    }
    
    private func loop() {
        self.state = next(self.state)
        switch  self.state {
        case .willShowLogin:
            showLoginFlow()
        case .willShowLoginRegisterFlow(type: let type):
            showLoginRegister(type: type)
        case .initial, .didShowLogin(type: _):
            fatalError("Unexpected Case in Main Coordinator")
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowLogin
        case .didShowLogin(type: let type):
            return .willShowLoginRegisterFlow(type: type)
        case .willShowLogin, .willShowLoginRegisterFlow(type: _):
            return nextState
        }
    }
    
    private func showLoginFlow() {
        let vc = StarterBuilder { output in
            switch output {
            case .willShowLoginRegisterView(let type):
                self.state = .didShowLogin(type: type)
                self.loop()
            }
        }.build()
        vc.view.backgroundColor = .white
        self.navigator.setViewControllers([vc], animated: true)
    }
    
    private func showLoginRegister(type: LoginRegisterUserType) {
        let vc = Login_RegisterBuilder(type: type) { _ in
            
        }.build()
        vc.view.backgroundColor = .red
        self.navigator.pushViewController(vc, animated: true)
    }
    
}
