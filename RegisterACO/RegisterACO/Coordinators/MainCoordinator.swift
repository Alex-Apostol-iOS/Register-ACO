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
        case .initial:
            fatalError("Unexpected Case in Main Coordinator")
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowLogin
        case .willShowLogin:
            return nextState
        }
    }
    
    private func showLoginFlow() {
        let vc = StarterBuilder { _ in
            
        }.build()
        vc.view.backgroundColor = .red
        self.navigator.setViewControllers([vc], animated: true)
    }
    
}
