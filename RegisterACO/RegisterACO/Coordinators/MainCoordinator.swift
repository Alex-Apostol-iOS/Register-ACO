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
        case didShowLoginRegisterFlow(ouput: Login_RegisterOutput)
        case willShowRegisterForm
        case willShowLoginFromLoginRegiser
        case didShowRegister
        case willShowHomeFlow
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
        case .willShowRegisterForm:
            showRegisterForm()
        case .willShowLoginFromLoginRegiser:
            showLogin()
        case .willShowHomeFlow:
            goToHomeFlow()
        case .initial, .didShowLogin(type: _), .didShowLoginRegisterFlow, .didShowRegister:
            fatalError("Unexpected Case in Main Coordinator")
       
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowLogin
        case .didShowLogin(type: let type):
            return .willShowLoginRegisterFlow(type: type)
        case .didShowLoginRegisterFlow(ouput: let ouput):
            switch ouput {
            case .goToRegisterForm:
                return .willShowRegisterForm
            case .goToLogin:
                return .willShowLoginFromLoginRegiser
            }
        case .didShowRegister:
            return .willShowHomeFlow
        case .willShowLogin, .willShowLoginRegisterFlow(type: _), .willShowRegisterForm, .willShowLoginFromLoginRegiser, .willShowHomeFlow:
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
        self.navigator.setViewControllers([vc], animated: true)
    }
    
    private func showLoginRegister(type: LoginRegisterUserType) {
        let vc = Login_RegisterBuilder(type: type) { output in
            switch output {
            case .goToRegisterForm:
                self.state = .didShowLoginRegisterFlow(ouput: .goToRegisterForm)
                self.loop()
            case .goToLogin:
                self.state = .didShowLoginRegisterFlow(ouput: .goToLogin)
                self.loop()
            }
        }.build()
        
        self.navigator.pushViewController(vc, animated: true)
    }
    
    private func showRegisterForm() {
        let vc = RegisterFromBuilder { output in
            switch output {
            case .goToHome:
                self.state = .didShowRegister
                self.loop()
            }
        }.build()
        navigator.pushViewController(vc, animated: true)
    }
    
    private func goToHomeFlow() {
        TabBarCoordinator(on: navigator, with: .initial).start()
    }
    
    private func showLogin() {
        let vc = LoginBuilder { [weak self] output in
            switch output {
            case .goToHome:
                self?.state = .willShowHomeFlow
                self?.loop()
            }
        }.build()
        
        navigator.pushViewController(vc, animated: true)
    }
    
}
